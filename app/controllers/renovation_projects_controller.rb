require 'matching_algo'

class RenovationProjectsController < ApplicationController
  before_action :authenticate_user!    
  before_action :set_renovation_projects, only: [:show, :edit, :update, :destroy, :update_status]

  def index
    @renovation_projects = RenovationProject.where(owner_id: current_user.id)
    authorize! :index, @renovation_projects.first
  end

  def show
    authorize! :show, @renovation_project

    if(params[:find_matches])
      @general_contractors = MatchingAlgo.new(@renovation_project).find_match
      unless @general_contractors.blank?
        @general_contractors.each do |gc|
          @renovation_project.general_contractors << gc unless @renovation_project.general_contractors.include?(gc)
          gc.update(engaged_with: (gc.engaged_with + 1))
        end
        @renovation_project.update(is_matched: true) 
      end
    end
    @general_contractors = @renovation_project.general_contractors
  end

  def new
    @renovation_project = RenovationProject.new
  end

  def edit
    authorize! :edit, @renovation_project
  end

  def create
    @renovation_project = RenovationProject.new(renovation_project_params)
    authorize! :create, @renovation_project

    respond_to do |format|
      if @renovation_project.save
        format.html { redirect_to @renovation_project, notice: 'Renovation Project was successfully created.' }
        format.json { render :show, status: :created, location: @renovation_project }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @renovation_project

    respond_to do |format|
      if @renovation_project.update(renovation_project_params)
        format.html { redirect_to @renovation_project, notice: 'Renovation Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @renovation_project }
      else
        format.html { render :edit }
        format.json { render json: @renovation_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_status
    authorize! :update_status, @renovation_project

    matching_detail = @renovation_project.matching_gcs.where(general_contractor_id: params[:gc], renovation_project_id: @renovation_project.id)
    unless matching_detail.blank?
      if(params[:owner_accept])
        matching_detail.first.update(is_owner_accepted: true)
      elsif(params[:owner_reject])
        matching_detail.first.update(is_owner_rejected: true)
      end
    end
    redirect_to @renovation_project
  end

  def destroy
    authorize! :destroy, @renovation_project

    @renovation_project.destroy
    respond_to do |format|
      format.html { redirect_to renovation_projects_url, notice: 'Renovation Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_renovation_projects
    @renovation_project = RenovationProject.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def renovation_project_params
    params.require(:renovation_project).permit(:latitude, :longitude, :min_budget, :max_budget, :is_design_service_req, :is_build_service_req, :owner_id)
  end
end

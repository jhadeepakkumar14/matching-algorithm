class RenovationProjectsController < ApplicationController
  before_action :authenticate_user!    
  before_action :set_renovation_projects, only: [:show, :edit, :update, :destroy]

  def index
    @renovation_projects = RenovationProject.all
  end

  def show
  end

  def new
    @renovation_project = RenovationProject.new
  end

  def edit
  end

  def create
    @renovation_project = RenovationProject.new(renovation_project_params)
    binding.pry  

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

  def destroy
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

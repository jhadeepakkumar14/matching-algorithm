class GeneralContractorsController < ApplicationController
  before_action :authenticate_user!    
  before_action :set_general_contractors, only: [:show, :edit, :update, :destroy]

  def index
    @general_contractors = GeneralContractor.all
  end

  def show
  end

  def new
    @general_contractor = GeneralContractor.new
  end

  def edit
  end

  def create
    @general_contractor = GeneralContractor.new(general_contractor_params)

    respond_to do |format|
      if @general_contractor.save
        format.html { redirect_to @general_contractor, notice: 'General Contractor was successfully created.' }
        format.json { render :show, status: :created, location: @general_contractor }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @general_contractor.update(general_contractor_params)
        format.html { redirect_to @general_contractor, notice: 'General Contractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_contractor }
      else
        format.html { render :edit }
        format.json { render json: @general_contractor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @general_contractor.destroy
    respond_to do |format|
      format.html { redirect_to general_contractors_url, notice: 'General Contractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_general_contractors
    @general_contractor = GeneralContractor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def general_contractor_params
    params.require(:general_contractor).permit(:latitude, :longitude, :min_project_budget, :max_project_budget, :is_offering_design_service, :is_offering_build_service, :contractor_id)
  end
end

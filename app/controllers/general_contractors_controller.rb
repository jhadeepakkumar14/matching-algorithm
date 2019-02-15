class GeneralContractorsController < ApplicationController
  def index
    @general_contractors = GeneralContractor.all  
  end

  # GET /company/1
  def show
  end

  def new
    @general_contractor = GeneralContractor.new
  end

  def create
    if @general_contractor.save
      respond_to do |format|
        format.html {
          flash[:notice] = "General Contractor created successfully."
          redirect_to company_path(@company)
        }
        format.api { render :action => 'show', :status => :created, :location => company_url(@company) }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.api { render_validation_errors(@company) }
      end
    end
  end

  def edit
  end

  def update
    @company.safe_attributes = params[:company]

    if @company.save
      respond_to do |format|
        format.html {
          flash[:notice] = l(:notice_successful_update)
          redirect_to company_path(@company)
        }
        format.api  { render_api_ok }
      end
    else
      respond_to do |format|
        format.html { render :action => :edit }
        format.api  { render_validation_errors(@company) }
      end
    end
  end

  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_back_or_default(companies_path) }
      format.api  { render_api_ok }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  # Only allow a trusted parameter "white list" through.
  def company_params
    params.require(:company).permit(:name, :email, :phone, :address, :is_user, :pan, :adhar)
  end
    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:name, :address, :email, :phone, :state, :country, :zip, :pan, :gst, :other_info, :contact_id, :relation_type_id)
    end
end

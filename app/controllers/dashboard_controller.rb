class DashboardController < ApplicationController
  before_action :authenticate_user!
    
  def index
    if current_user.is_contractor?
      redirect_to general_contractors_path
    elsif current_user.is_owner?
      redirect_to renovation_projects_path
    end    
  end
end

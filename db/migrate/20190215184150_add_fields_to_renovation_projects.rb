class AddFieldsToRenovationProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :renovation_projects, :owner, index: true  
  end
end

class CreateGeneralContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :general_contractors do |t|
      t.float :latitude
      t.float :longitude
      t.float :min_project_budget
      t.float :max_project_budget
      t.boolean :is_offering_design_service
      t.boolean :is_offering_build_service

      t.timestamps
    end
  end
end

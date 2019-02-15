class CreateRenovationProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :renovation_projects do |t|
      t.float :latitude
      t.float :longitude
      t.float :min_budget
      t.float :max_budget
      t.boolean :is_design_service_req
      t.boolean :is_build_service_req

      t.timestamps
    end
  end
end

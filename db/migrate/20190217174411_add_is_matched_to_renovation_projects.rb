class AddIsMatchedToRenovationProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :renovation_projects, :is_matched, :boolean, default: false, null: false
  end
end

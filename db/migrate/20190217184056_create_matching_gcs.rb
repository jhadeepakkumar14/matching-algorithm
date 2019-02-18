class CreateMatchingGcs < ActiveRecord::Migration[5.2]
  def change
    create_table :matching_gcs do |t|
      t.references :renovation_project
      t.references :general_contractor
      t.boolean :is_owner_accepted
      t.boolean :is_owner_rejected
      t.boolean :is_contractor_accepted
      t.boolean :is_contractor_rejected

      t.timestamps
    end
  end
end

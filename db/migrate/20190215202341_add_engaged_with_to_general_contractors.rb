class AddEngagedWithToGeneralContractors < ActiveRecord::Migration[5.2]
  def change
    add_column :general_contractors, :engaged_with, :integer, default: 0
  end
end

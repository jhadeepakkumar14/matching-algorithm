class AddRankToGeneralContractors < ActiveRecord::Migration[5.2]
  def change
    add_column :general_contractors, :rank, :integer, default: 1
  end
end

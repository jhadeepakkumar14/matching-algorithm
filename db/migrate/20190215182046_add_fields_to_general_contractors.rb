class AddFieldsToGeneralContractors < ActiveRecord::Migration[5.2]
  def change
    add_reference :general_contractors, :contractor, index: true
  end
end

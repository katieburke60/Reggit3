class RenameColumnTypeInRegulationsToStatus < ActiveRecord::Migration[5.0]
  def change
    rename_column :regulations, :type, :reg_status
  end
end

class AddAgencyIdToRegulations < ActiveRecord::Migration[5.0]
  def change
    add_column :regulations, :agency_id, :integer
  end
end

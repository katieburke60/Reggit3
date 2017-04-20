class CreateRegulationBodies < ActiveRecord::Migration[5.0]
  def change
    create_table :regulation_bodies do |t|
      t.integer :regulation_id
      t.text :html_blob

      t.timestamps
    end
  end
end

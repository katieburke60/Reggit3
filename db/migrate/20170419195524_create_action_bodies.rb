class CreateActionBodies < ActiveRecord::Migration[5.0]
  def change
    create_table :action_bodies do |t|
      t.integer :action_id
      t.text :html_blob
      t.string :url

      t.timestamps
    end
  end
end

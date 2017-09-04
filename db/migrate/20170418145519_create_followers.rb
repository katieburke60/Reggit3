class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer :action_id
      t.integer :citizen_id

      t.timestamps
    end
  end
end

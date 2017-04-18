class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.integer :regulation_id
      t.integer :citizen_id

      t.timestamps
    end
  end
end

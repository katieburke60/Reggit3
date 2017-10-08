class CreateActionFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :actionFollows do |t|
      t.integer :action_id
      t.integer :citizen_id

      t.timestamps
    end
  end
end

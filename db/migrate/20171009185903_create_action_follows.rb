class CreateActionFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :action_follows do |t|
      t.boolean :following
      t.integer :citizen_id
      t.integer :action_id
    end
  end
end

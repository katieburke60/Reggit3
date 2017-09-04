class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :vote
      t.integer :citizen_id
      t.integer :action_id

      t.timestamps
    end
  end
end

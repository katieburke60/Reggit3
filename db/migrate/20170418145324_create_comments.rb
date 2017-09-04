class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string  :description
      t.integer :citizen_id
      t.integer :action_id

      t.timestamps
    end
  end
end

class CreateCatFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :cat_follows do |t|
      t.integer :category_id
      t.integer :citizen_id

      t.timestamps
    end
  end
end

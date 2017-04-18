class CreateCitizens < ActiveRecord::Migration[5.0]
  def change
    create_table :citizens do |t|
      t.belongs_to :account, foreign_key: true
      t.string :name
      t.string :location
      t.integer :age
      t.string :gender

      t.timestamps
    end
  end
end

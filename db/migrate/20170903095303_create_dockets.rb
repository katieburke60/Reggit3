class CreateDockets < ActiveRecord::Migration[5.0]
  def change
    create_table :dockets do |t|
      t.string :name
      t.string :type
    end
  end
end

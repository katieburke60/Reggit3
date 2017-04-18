class CreateRegulations < ActiveRecord::Migration[5.0]
  def change
    create_table :regulations do |t|
      t.string :agency
      t.integer :category_id
      t.boolean :major_rule
      t.string :title
      t.string :summary
      t.string :type
      t.string :url
      t.integer :document_number
      t.string :publication_date
      t.integer :federal_register_id

      t.timestamps
    end
  end
end

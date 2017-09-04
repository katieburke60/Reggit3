class CreateRegulations < ActiveRecord::Migration[5.0]
  def change
    create_table :regulations do |t|
      t.string :agency
      t.string :subagency
      t.integer :agency_id
      t.integer :category_id
      t.boolean :major_rule
      t.string :title
      t.string :summary
      t.string :type
      t.string :html_url
      t.string :document_number
      t.string :publication_date
      t.string :fedregister_id
      t.string :category_name
      t.string :docket_id
      t.boolean :open_for_comment
      t.integer :comments_received
      t.string :comment_end_date
      t.string :comment_start_date
      t.string :action
      t.integer :attachment_number
      t.string :contact
      t.string :reg_body
      t.string :status
      t.string :tags

      t.timestamps
    end
  end
end

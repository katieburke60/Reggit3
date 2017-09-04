class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :title
      t.string :summary
      t.string :type
      t.string :agency_acronym
      t.string :agency_full
      t.integer :agency_id
      t.string :subagency
      t.integer :category_id
      t.string :category_name
      t.string :status
      t.boolean :significant
      t.string :action
      t.string :action_body
      t.string :publication_date
      t.string :document_number
      t.string :fedregister_id
      t.string :reg_id
      t.string :docket_id
      t.boolean :open_for_comment
      t.integer :comments_received
      t.string :comment_end_date
      t.string :comment_start_date
      t.integer :attachment_number
      t.string :contact
      t.string :tags
      t.string :corrections
      t.string :date_desc
      t.string :html_url

      t.timestamps
    end
  end
end

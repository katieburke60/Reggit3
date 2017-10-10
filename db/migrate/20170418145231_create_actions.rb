class CreateActions < ActiveRecord::Migration[5.0]
  def change
    create_table :actions do |t|
      t.string :title
      t.string :summary
      t.string :desc
      t.string :agency_acronym
      t.string :agency_full
      t.integer :agency_id
      t.string :subagency
      t.integer :subagency_id
      t.integer :category_id
      t.string :category_name
      t.string :status
      t.date :effective_date
      t.boolean :significant
      t.string :priority_category
      t.string :action
      t.string :action_body
      t.date :publication_date
      t.string :document_number
      t.string :regulation_title
      t.string :fedregister_id
      t.string :cfr
      t.string :rin
      t.string :docket_id
      t.boolean :open_for_comment
      t.integer :comments_received
      t.date :comment_end_date
      t.date :comment_start_date
      t.string :comments_url
      t.integer :supporting_docs_number
      t.string :contact
      t.string :tags
      t.string :corrections
      t.string :date_desc
      t.integer :days_left
      t.integer :start_page
      t.string :html_url

      t.timestamps
    end
  end
end

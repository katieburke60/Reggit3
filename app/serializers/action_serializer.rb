class ActionSerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_id, :title, :summary, :document_number, :publication_date, :fedregister_id, :docket_id, :open_for_comment, :comment_start_date, :comment_end_date, :action, :publication_date, :comments_received, :contact, :status, :subagency, :days_left

  has_many :votes
  has_many :comments
  has_one :action_body
end

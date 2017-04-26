class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :citizen_id, :regulation_id
  belongs_to :citizen
  belongs_to :regulation
end

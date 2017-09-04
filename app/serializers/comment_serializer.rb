class CommentSerializer < ActiveModel::Serializer
  attributes :id, :description, :citizen_id, :action_id
  belongs_to :citizen
  belongs_to :action
end

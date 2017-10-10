class ActionFollowSerializer < ActiveModel::Serializer
  attributes :id, :citizen_id, :action_id
  belongs_to :citizen
  belongs_to :action

end

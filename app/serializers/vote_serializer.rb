class VoteSerializer < ActiveModel::Serializer
  attributes :id, :vote, :citizen_id, :action_id
  belongs_to :citizen
  belongs_to :action

end

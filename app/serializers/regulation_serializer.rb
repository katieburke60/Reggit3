class RegulationSerializer < ActiveModel::Serializer
  attributes :id
  has_many :comments
  has_many :votes
  has_one :regulation_body
end

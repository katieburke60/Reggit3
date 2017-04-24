class RegulationSerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_id
  has_many :comments
  has_many :votes
  has_one :regulation_body
end

class RegulationSerializer < ActiveModel::Serializer
  attributes :id, :category_name, :category_id, :title, :summary, :reg_status, :publication_date
  has_many :votes
  has_many :comments
  has_one :regulation_body
end

class CitizenSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :age, :gender
  belongs_to :account
  has_many :actions

end

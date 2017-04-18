class Citizen < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :regulations, through: :followers
  has_many :regulations,through: :votes
  has_many :regulations,through: :comments
  belongs_to :account
end

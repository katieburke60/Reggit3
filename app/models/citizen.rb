class Citizen < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :actions, through: :followers
  has_many :actions,through: :votes
  has_many :actions,through: :comments
  belongs_to :account
end

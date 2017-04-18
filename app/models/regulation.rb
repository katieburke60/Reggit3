class Regulation < ApplicationRecord
  has_many :comments
  has_many :votes
  has many :followers
  has_many :citizens, through: :followers
  has_many :citizens, through: :comments
  has_many :citizens, through: :votes
  belongs_to :category

end

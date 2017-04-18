class Regulation < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :citizens, through: :followers
  has_many :citizens, through: :comments
  belongs_to :category

end

class Action < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :followers
  has_many :action_follows
  has_many :citizens, through: :action_follows
  has_many :citizens, through: :comments
  has_many :citizens, through: :votes
  belongs_to :category
  belongs_to :docket
  has_one :action_body

end

class Citizen < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :action_follows
  has_many :cat_follows
  has_many :actions, through: :action_follows
  # has_many :actions, through: :votes
  # has_many :actions, through: :comments
  has_many :categories, through: :cat_follows
  belongs_to :account
end

class Category < ApplicationRecord
  has_many :actions
  has_many :cat_follows
  has_many :citizens, through: :cat_follows
end

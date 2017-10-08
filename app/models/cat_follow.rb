class CatFollower < ApplicationRecord
  belongs_to :citizen
  belongs_to :category
end

class Follower < ApplicationRecord
  belongs_to :regulation
  belongs_to  :citizen
end

class Follower < ApplicationRecord
  belongs_to :action
  belongs_to  :citizen
end

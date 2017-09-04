class Vote < ApplicationRecord
  belongs_to :action
  belongs_to :citizen
end

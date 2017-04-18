class Vote < ApplicationRecord
  belongs_to :regulation
  belongs_to :citizen
end

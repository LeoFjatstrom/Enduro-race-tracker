class StationRegistration < ApplicationRecord
  belongs_to :driver
  belongs_to :user
  belongs_to :station
end

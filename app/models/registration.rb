class Registration < ApplicationRecord
  belongs_to :driver
  belongs_to :user
  belongs_to :station
end

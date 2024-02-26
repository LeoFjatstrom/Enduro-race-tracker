class Competition < ApplicationRecord
    has_many :competition_classes
    has_many :competition_entries
    has_many :drivers, through: :competition_entries
end

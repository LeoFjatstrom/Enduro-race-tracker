class Competition < ApplicationRecord
    has_many :competition_classes
    has_many :competition_entries
    has_many :drivers, through: :competition_entries

    has_many :stations
    has_many :registrations, through: :stations
    has_many :drivers, through: :registrations
end

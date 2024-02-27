class Competition < ApplicationRecord
    has_many :competition_classes
    has_many :competition_entries
    has_many :drivers, through: :competition_entries

    has_many :stations
    has_many :station_registrations, through: :stations
    has_many :drivers, through: :station_registrations
end

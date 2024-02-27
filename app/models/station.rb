class Station < ApplicationRecord
    belongs_to :competition
    has_many :station_registrations
    has_many :drivers, through: :station_registrations

    validates :name, presence: true
    validates :station_type, presence: true, inclusion: { in: ['start', 'goal'], message: "%{value} is not a valid station type" }
end

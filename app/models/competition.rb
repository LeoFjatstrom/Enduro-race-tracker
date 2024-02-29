class Competition < ApplicationRecord
    has_many :competition_classes, dependent: :destroy
    has_many :competition_entries, dependent: :destroy
    has_many :stations, dependent: :destroy
    
    has_many :drivers, through: :competition_entries
    has_many :station_registrations, through: :stations

    accepts_nested_attributes_for :competition_classes, allow_destroy: true, reject_if: proc { |attributes| attributes['name'].blank? }
    accepts_nested_attributes_for :stations, allow_destroy: true
end

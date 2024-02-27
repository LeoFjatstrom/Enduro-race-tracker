class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :competition_entries
  has_many :competitions, through: :competition_entries

  has_many :station_registrations
  has_many :stations, through: :station_registrations
end

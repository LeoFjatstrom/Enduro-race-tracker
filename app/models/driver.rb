class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :competition_entries
  has_many :competitions, through: :competition_entries

  has_many :registrations
  has_many :stations, through: :registrations
end

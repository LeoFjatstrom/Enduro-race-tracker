class CompetitionEntry < ApplicationRecord
  belongs_to :driver
  belongs_to :competition

  validates :start_number, uniqueness: { scope: :competition_id }
end

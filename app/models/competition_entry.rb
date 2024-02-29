class CompetitionEntry < ApplicationRecord
  belongs_to :driver
  belongs_to :competition
  belongs_to :competition_class

  validates :start_number, uniqueness: { scope: :competition_id }
end

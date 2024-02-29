class AddCompetitionClassIdToCompetitionEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :competition_entries, :competition_class_id, :integer
  end
end

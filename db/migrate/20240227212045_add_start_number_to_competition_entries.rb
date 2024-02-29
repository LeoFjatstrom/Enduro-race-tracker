class AddStartNumberToCompetitionEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :competition_entries, :start_number, :integer
    add_index :competition_entries, [:competition_id, :start_number], unique: true
  end
end

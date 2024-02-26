class CreateCompetitionEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :competition_entries do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end

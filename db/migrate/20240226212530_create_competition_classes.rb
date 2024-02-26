class CreateCompetitionClasses < ActiveRecord::Migration[7.0]
  def change
    create_table :competition_classes do |t|
      t.string :name
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end

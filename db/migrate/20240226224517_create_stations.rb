class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.string :name
      t.string :station_type
      t.references :competition, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :station, null: true, foreign_key: true
      t.references :competition, null: false, foreign_key: true
      
      t.datetime :passed_at

      t.timestamps
    end
  end
end

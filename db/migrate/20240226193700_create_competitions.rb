class CreateCompetitions < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_time
      t.string :competition_type
      t.integer :max_number_of_drivers
      t.timestamps
    end
  end
end

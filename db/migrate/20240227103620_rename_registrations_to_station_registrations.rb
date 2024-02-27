class RenameRegistrationsToStationRegistrations < ActiveRecord::Migration[7.0]
  def change
    rename_table :registrations, :station_registrations
  end
end

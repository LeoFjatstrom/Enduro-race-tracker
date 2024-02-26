class AddopenForRegistrationToCompetitions < ActiveRecord::Migration[7.0]
  def change
    add_column :competitions, :open_for_registration, :boolean, default: true
  end
end

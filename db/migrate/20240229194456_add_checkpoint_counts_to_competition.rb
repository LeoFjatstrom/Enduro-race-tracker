class AddCheckpointCountsToCompetition < ActiveRecord::Migration[7.0]
  def change
    add_column :competitions, :checkpoint_count, :integer
  end
end

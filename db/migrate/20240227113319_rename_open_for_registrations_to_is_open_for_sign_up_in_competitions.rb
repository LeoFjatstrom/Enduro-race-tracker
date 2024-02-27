class RenameOpenForRegistrationsToIsOpenForSignUpInCompetitions < ActiveRecord::Migration[7.0]
  def change
    rename_column :competitions, :open_for_registration, :is_open_for_sign_up
  end
end

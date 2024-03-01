class CreateInitialSchema < ActiveRecord::Migration[7.0]
  def change
    # Admins table
    create_table :admins do |t|
      t.string :email, default: "", null: false
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :admins, :email, unique: true
    add_index :admins, :reset_password_token, unique: true

    # Competition Classes table
    create_table :competition_classes do |t|
      t.string :name
      t.integer :competition_id, null: false
      t.timestamps null: false
    end
    add_index :competition_classes, :competition_id

    # Competition Entries table
    create_table :competition_entries do |t|
      t.integer :driver_id, null: false
      t.integer :competition_id, null: false
      t.integer :start_number
      t.integer :competition_class_id
      t.timestamps null: false
    end
    add_index :competition_entries, [:competition_id, :start_number], unique: true
    add_index :competition_entries, :driver_id

    # Competitions table
    create_table :competitions do |t|
      t.string :name
      t.datetime :start_time
      t.string :competition_type
      t.integer :max_number_of_drivers
      t.boolean :is_open_for_sign_up, default: true
      t.integer :checkpoint_count
      t.timestamps null: false
    end

    # Drivers table
    create_table :drivers do |t|
      t.string :email, default: "", null: false
      t.string :name, default: "", null: false
      t.string :encrypted_password, default: "", null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end
    add_index :drivers, :email, unique: true
    add_index :drivers, :reset_password_token, unique: true

    # Station Registrations table
    create_table :station_registrations do |t|
      t.integer :driver_id, null: false
      t.integer :user_id, null: false
      t.integer :station_id
      t.integer :competition_id, null: false
      t.datetime :passed_at
      t.timestamps null: false
    end
    add_index :station_registrations, :competition_id
    add_index :station_registrations, :driver_id
    add_index :station_registrations, :station_id
    add_index :station_registrations, :user_id

    # Stations table
    create_table :stations do |t|
      t.string :name
      t.string :station_type
      t.integer :competition_id, null: false
      t.timestamps null: false
    end
    add_index :stations, :competition_id

    # Foreign Keys
    add_foreign_key :competition_classes, :competitions
    add_foreign_key :competition_entries, :competitions
    add_foreign_key :competition_entries, :drivers
    add_foreign_key :station_registrations, :competitions
    add_foreign_key :station_registrations, :drivers
    add_foreign_key :station_registrations, :stations
    add_foreign_key :station_registrations, :users
    add_foreign_key :stations, :competitions
  end
end

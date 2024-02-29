class User::StationRegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition, only: [:new, :create]

  def new
    @station_registration = StationRegistration.new
    @stations = @competition.stations.order(:name)
    @previous_registrations = StationRegistration.where(competition_id: @competition.id).order(passed_at: :desc)

    # Set the initially selected station if one is stored in the session or passed as a parameter
    @selected_station_id = session[:station_id] || params[:station_id]

    if @selected_station_id.present?
      @current_station = Station.find(@selected_station_id)
      @previous_registrations_for_current_station = @current_station.station_registrations.order(passed_at: :desc)
    end
  end

  def create
    station_id = params[:station_registration][:station_id]
    start_number = params[:station_registration][:start_number]
    competition_id = params[:competition_id]
  
    competition_entry = CompetitionEntry.find_by(start_number: start_number, competition_id: competition_id)
  
    if competition_entry
      @station_registration = StationRegistration.new(
        user: current_user,
        station_id: station_id,
        driver_id: competition_entry.driver_id, # Link to the driver through the competition entry
        competition_id: competition_id,
        passed_at: Time.current
      )
  
      if @station_registration.save
        session[:station_id] = station_id
        redirect_to new_user_competition_station_registration_path(competition_id, station_id: station_id), notice: 'Successfully registered driver passing through the station.'
      else
        render :new, alert: 'Could not register the driver. Please check the details and try again.'
      end
    else
      redirect_to new_user_competition_station_registration_path(competition_id), alert: 'No matching driver found for the provided start number in this competition.'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end

  private

    def set_competition
      @competition = Competition.find(params[:competition_id])
    end
  
    def station_registration_params
      params.require(:station_registration).permit(:station_id, :start_number, :passed_at)
    end
end

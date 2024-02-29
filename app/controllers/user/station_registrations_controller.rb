class User::StationRegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition, only: [:new, :create]

  def new
    @station_registration = StationRegistration.new
    @competition = Competition.find(params[:competition_id])
    @stations = @competition.stations

    # Set the initially selected station if one is stored in the session
    if session[:station_id]
      @selected_station_id = session[:station_id]
    end
  end  

  def create
    station_id = params[:station_registration][:station_id]
    start_number = params[:station_registration][:start_number]
    competition_id = params[:competition_id]
  
    # Attempt to find the competition entry using the provided start_number and competition_id
    competition_entry = CompetitionEntry.find_by(start_number: start_number, competition_id: competition_id)
  
    # If a competition entry is found, proceed with creating the station registration
    if competition_entry
      @station_registration = StationRegistration.new(
        user: current_user,
        station_id: station_id,
        driver_id: competition_entry.driver_id, # Use driver_id directly
        competition_id: competition_id
      )
  
      if @station_registration.save
        session[:station_id] = @station_registration.station_id
        redirect_to new_user_competition_station_registration_path(competition_id), notice: 'Successfully registered driver passing through the station.'
      else
        # Handle the case where station registration couldn't be saved
        render :new, alert: 'Could not register the driver. Please check the details and try again.'
      end
    else
      # Handle the case where no matching competition entry was found
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

    def clear_station
      session.delete(:station_id)
      redirect_to some_path, notice: 'Station selection cleared.'
    end

end

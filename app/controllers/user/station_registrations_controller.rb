class User::StationRegistrationsController < ApplicationController
  before_action :authenticate_user! # Devise helper
  before_action :set_competition, only: [:new, :create]

  def new
    @station_registration = StationRegistration.new
    @competition = @competition
    @stations = @competition.stations
  end

  def create
    @station_registration = @competition.station_registrations.new(station_registration_params)
    @station_registration.user = current_user

    if @station_registration.save
      redirect_to [user_competition_path(@competition)], notice: 'Successfully registered for the station.'
    else
      render :new
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
  
    def registration_params
      params.require(:registration).permit(:driver_id, :user_id, :station_id, :passed_at)
    end

end

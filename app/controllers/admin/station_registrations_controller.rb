class Admin::StationRegistrationsController < ApplicationController
  before_action :authenticate_admin! # Devise helper
  before_action :set_competition, only: [:new, :create]

  def new
    @station_registration = StationRegistration.new
    # You might want to filter stations based on the competition
    @stations = @competition.stations
  end

  def create
    @station_registration = StationRegistration.new(station_registration_params)
    @station_registration.admin = current_admin # Assuming you have a user association
    if @station_registration.save
      redirect_to @competition, notice: 'Registration successful.'
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

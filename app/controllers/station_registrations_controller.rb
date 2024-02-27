class StationRegistrationsController < ApplicationController
  def new
    @registration = Registration.new
    @stations = Station.where(station_type: ['start', 'finish'])
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      flash[:notice] = 'Registration was successfully created.'
      redirect_to new_registration_path
    else
      @stations = Station.where(station_type: ['start', 'finish'])
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
  
    def registration_params
      params.require(:registration).permit(:driver_id, :user_id, :station_id, :passed_at)
    end
end

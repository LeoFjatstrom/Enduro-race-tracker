class Driver::CompetitionEntriesController < ApplicationController
  before_action :authenticate_driver!
  before_action :set_competition, except: :index

  def index
    @competition_entries = current_driver.competition_entries.includes(:competition)
    @competitions = current_driver.competitions.distinct
  end

  def show
  end

  def new
    @competition_entry = CompetitionEntry.new
  end
  
  def create
    @competition_entry = current_driver.competition_entries.new(competition_entry_params)
    @competition_entry.competition_id = params[:competition_id] # Ensure this parameter is correctly sourced
  
    if @competition_entry.save
      redirect_to driver_competition_entries_path, notice: 'Successfully signed up for the competition.'
    else
      render :new
    end
  end
  
  def edit
  end


  def update
  end

  def destroy
    @competition_entry = current_driver.competition_entries.find(params[:id])
    @competition_entry.destroy
    redirect_to driver_competition_entries_path, notice: 'Competition entry was successfully canceled.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.includes(:drivers).find(params[:competition_id])
    end

    # Only allow a list of trusted parameters through.
    def competition_entry_params
      params.require(:competition_entry).permit(:start_number, :competition_class_id).merge(competition_id: params[:competition_id])
    end
end

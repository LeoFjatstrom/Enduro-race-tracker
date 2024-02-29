class User::CompetitionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_competition, only: %i[ show ]

  # GET /competitions or /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1 or /competitions/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.includes(:drivers).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competition_params
      params.require(:competition).permit(:name, :start_time, :competition_type, :max_number_of_drivers, :is_open_for_sign_up)
    end
end

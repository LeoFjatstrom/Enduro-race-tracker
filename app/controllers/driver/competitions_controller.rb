class Driver::CompetitionsController < ApplicationController
  before_action :authenticate_driver!
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
end

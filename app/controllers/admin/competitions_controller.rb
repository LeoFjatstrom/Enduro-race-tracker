class Admin::CompetitionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_competition, only: %i[ show edit update destroy ]

  # GET /competitions or /competitions.json
  def index
    @competitions = Competition.all
  end

  # GET /competitions/1 or /competitions/1.json
  def show
    @competition = @competition
  end

  # GET /competitions/new
  def new
    @competition = Competition.new
  end

  # GET /competitions/1/edit
  def edit
  end

  # POST /competitions or /competitions.json
  def create
    @competition = Competition.new(competition_params)

    respond_to do |format|
      if @competition.save
        if @competition.competition_type == 'enduro'
          checkpoint_count = params[:competition][:checkpoint_count].to_i
          create_checkpoints_for_enduro(@competition, checkpoint_count)
        else
          @competition.stations.create(name: 'Start', station_type: 'Start')
          @competition.stations.create(name: 'Goal', station_type: 'Goal')
        end

        format.html { redirect_to admin_competition_url(@competition), notice: "Competition was successfully created." }
        format.json { render :show, status: :created, location: @competition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitions/1 or /competitions/1.json
  def update
    respond_to do |format|
      if @competition.update(competition_params)
        format.html { redirect_to admin_competition_url(@competition), notice: "Competition was successfully updated." }
        format.json { render :show, status: :ok, location: @competition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @competition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitions/1 or /competitions/1.json
  def destroy
    @competition.destroy

    respond_to do |format|
      format.html { redirect_to admin_competitions_url, notice: "Competition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competition
      @competition = Competition.includes(:drivers).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def competition_params
      params.require(:competition).permit(:name, :start_time, :checkpoint_count, :competition_type, :max_number_of_drivers, :is_open_for_sign_up,
        competition_classes_attributes: [:id, :name, :_destroy])
    end

    def create_checkpoints_for_enduro(competition, checkpoint_count)
      puts(competition)
      # Create Start station
      competition.stations.create(name: 'Start', station_type: "Start")
      
      # Create the specified number of checkpoints
      1.upto(checkpoint_count) do |i|
        puts(i)
        competition.stations.create(name: "Checkpoint #{i}", station_type: "Checkpoint")
      end
    
      # Create Goal station
      competition.stations.create(name: 'Goal', station_type: "Goal")
    end
end

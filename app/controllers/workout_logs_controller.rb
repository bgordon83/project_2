class WorkoutLogsController < ProtectedController
  before_action :set_workout_log, only: [:show, :update, :destroy]

  # GET /workout_logs
  def index
    @workout_log = current_user.workout_logs.all

    render json: @workout_Logs
  end

  # GET /workout_logs/1
  def show
  #  @workout_log = current_user.workout_logs.find

    render json: @workout_log
  end

  # POST /workout_logs
  def create
    @workout_log = current_user.workout_logs.build(workout_log_params)

    if @workout_log.save
      render json: @workout_log, status: :created, location: @workout_log
    else
      render json: @workout_log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workout_logs/1
  def update
    if @workout_log.update(workout_log_params)
      render json: @workout_log
    else
      render json: @workout_log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workout_logs/1
  def destroy
    @workout_log.destroy

    head :no_content
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_workout_log
      @workout_log = current_user.workout_logs.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workout_log_params
      params.require(:workout_log).permit(:routine, :sets, :reps, :time_spent, :user_id)
    end
end

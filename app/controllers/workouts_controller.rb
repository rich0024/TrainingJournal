class WorkoutsController < ApplicationController

    def new
        params[:lesson_id] && @lesson = Lesson.find_by_id(params[:lesson_id])
        @workout = @lesson.workouts.build
    end

    def create
        @workout = current_user.workouts.build(workout_params)
        if @workout.save
            redirect_to workouts_path
        else
            render :new
        end
    end

    def show
        @workout = workout.find_by_id(params[:id])
    end

    private

    def workout_params
        params.require(:workout).permit(:lesson_id, :name, :category, :duration, :set, :rep, :details)
    end
end

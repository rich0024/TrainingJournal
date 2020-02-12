class WorkoutsController < ApplicationController

    def index
        @user = current_user
        @lesson = Lesson.find_by_id(params[:lesson_id])
        @workouts = Lesson.find_by_id(params[:lesson_id]).workouts
    end

    def new
        if params[:lesson_id] && @lesson = Lesson.find_by_id(params[:lesson_id])
            @workout = @lesson.workouts.build
        else
            redirect_to lesson_workouts_path(@lesson)
        end
    end


    def create
        @workout = current_user.workouts.build(workout_params)
        @workout.user_id = current_user.id
        if @workout.save
            redirect_to lesson_workouts_path(params[:workout][:lesson_id])
        else
            redirect_to new_lesson_workout_path(params[:workout][:lesson_id])
        end
    end

    def show
        @workout = workout.find_by_id(params[:id])
    end

    def edit
        @workout = workout.find_by_id(params[:id])
    end

    def update
        @workout = Workout.find_by_id(params[:id])
        if @workout.update(workout_params)
            redirect_to workouts_path
        else
            render edit_workout_path
        end
    end

    def destroy
        @workout = Workout.find_by_id(params[:id])
        @workout.destroy
        redirect_to lesson_workouts_path(params[:id])
    end

    private

    def workout_params
        params.require(:workout).permit(:lesson_id, :name, :details)
    end

end

class WorkoutsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_workout, only: [:show, :edit, :update]
    before_action :redirect_if_not_correct_workout_user, only: [:edit, :update, :show]

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
        @workout = Workout.find_by_id(params[:id])
        redirect_if_not_correct_workout_user
    end

    def edit
        @workout = Workout.find_by_id(params[:id])
    end

    def update
        @workout = Workout.find_by_id(params[:id])
        if @workout.update(workout_params)
            redirect_to lesson_workouts_path(params[:workout][:lesson_id])
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

    def set_workout
        @workout = Workout.find_by_id(params[:id])
        if !@workout
            redirect_to user_path(current_user.id)
          end
        end

    def redirect_if_not_correct_workout_user
        redirect_to user_path(current_user.id) if current_user != @workout.user
    end

end

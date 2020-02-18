class WorkoutsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_workout, only: [:edit, :update, :destroy]
    before_action :redirect_if_not_correct_workout_user, only: [:edit, :update, :destroy]

    def index
        @lesson = current_user.lessons.find_by_id(params[:lesson_id])
        @workouts = current_user.lessons.find_by_id(params[:lesson_id]).workouts
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
        @workout.category_id = Lesson.find_by_id(params[:workout][:lesson_id]).category_id
        if @workout.save
            redirect_to lesson_workouts_path(params[:workout][:lesson_id])
        else
            render :new
        end
    end


    def edit
        @workout = Workout.find_by_id(params[:id])
    end

    def update
        @workout = Workout.find_by_id(params[:id])
        if @workout.update(workout_params)
            redirect_to lesson_workouts_path(@workout.lesson_id)
        else
            render :edit
        end
    end

    def destroy
        @workout = Workout.find_by_id(params[:id])
        @workout.destroy
        redirect_to lesson_workouts_path(@workout.lesson_id)
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
        redirect_to user_path(current_user.id) if current_user.id != @workout.user_id
    end

end

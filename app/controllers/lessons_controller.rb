class LessonsController < ApplicationController

    def index
        @user = current_user
        @lessons = current_user.lessons
    end

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
        if @lesson.save
            redirect_to lessons_path
        else
            render :new
        end
    end

    def show
        @lesson = Lesson.find_by_id(params[:id])
        @workouts = Lesson.find_by_id(params[:id]).workouts
    end

    def edit 
        @lesson = Lesson.find_by_id(params[:id])
    end

    def update 
        @lesson = Lesson.find_by_id(params[:id])
        if @lesson.update(lesson_params)
            redirect_to lessons_path
        else
            render edit_lesson_path
        end
    end

    def destroy 
        @lesson = Lesson.find_by_id(params[:id])
        @lesson.destroy
        redirect_to lessons_path
    end

    private

    def lesson_params
        params.require(:lesson).permit(:name, :date)
    end
end

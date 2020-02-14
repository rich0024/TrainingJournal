class LessonsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_lesson, only: [:show, :edit, :update]
    before_action :redirect_if_not_correct_lesson_user, only: [:edit, :update]

    def index
        @user = current_user
        @lessons = current_user.lessons
    end

    def new
        @lesson = Lesson.new
        @lesson.build_category
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
    end

    def edit 
    end

    def update 
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
        params.require(:lesson).permit(:name, :date, :category_id, category_attributes: [:name])
    end

    def set_lesson
        @lesson = Lesson.find_by_id(params[:id])
        if !@lesson
            redirect_to user_path(current_user.id)
          end
        end

    def redirect_if_not_correct_lesson_user
        redirect_to root_path if current_user.id != @lesson.user_id
    end
end

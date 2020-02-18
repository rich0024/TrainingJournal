class LessonsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_lesson, only: [:show, :edit, :update]
    before_action :redirect_if_not_correct_lesson_user, only: [:edit, :update, :destroy]

    def index
        @user = current_user
        if !params[:date].blank?
            if params[:date] == "January"
                @lessons = current_user.lessons.january
            elsif params[:date] == "February"
                @lessons = current_user.lessons.february
            elsif params[:date] == "March"
                @lessons = current_user.lessons.march
            elsif params[:date] == "April"
                @lessons = current_user.lessons.april
            elsif params[:date] == "May"
                @lessons = current_user.lessons.may
            elsif params[:date] == "June"
                @lessons = current_user.lessons.june
            elsif params[:date] == "July"
                @lessons = current_user.lessons.july
            elsif params[:date] == "August"
                @lessons = current_user.lessons.august
            elsif params[:date] == "September"
                @lessons = current_user.lessons.september
            elsif params[:date] == "October"
                @lessons = current_user.lessons.october
            elsif params[:date] == "November"
                @lessons = current_user.lessons.november            
            elsif params[:date] == "December"
                @lessons = current_user.lessons.december
            end
        else
        # if no filters are applied, show all posts
        @lessons = current_user.lessons.all
        end
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
          @lesson = @user.lessons.build
        else
          @lesson = Lesson.new
        end
        @lesson.build_category
      end

    def create
        @lesson = current_user.lessons.build(lesson_params)
        if @lesson.save
            redirect_to user_lessons_path(current_user.id)
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

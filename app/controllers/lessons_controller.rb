class LessonsController < ApplicationController

    def index
        @lessons = current_user.lessons
    end

    def new
        @lesson = Lesson.new
    end

    def create
        @lesson = current_user.lessons.build(lesson_params)
        if @lesson.save
            redirect_to '/lessons'
        else
            render :new
        end
    end

    def show
        @lesson = Lesson.find_by_id(params[:id])
    end

    private

    def lesson_params
        params.require(:lesson).permit(:name, :datetime)
    end
end

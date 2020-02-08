class UsersController < ApplicationController
    def new
        @user =User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to '/new'
        end

        def show
            @user = User.find_by_id(params[:user_id])
        end

    end

    private

    def user_params
        params.require(:user).permit(:email, :username, :password)
    end


end

class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    private 

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to root_path if !logged_in?
    end

    def current_user
        User.find_by_id(session[:user_id])
    end

    def redirect_if_logged_in
        redirect_to user_path(session[:user_id]) if logged_in?
    end

end

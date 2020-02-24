class SessionsController < ApplicationController

  def home
    redirect_if_logged_in
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Incorrect login info, please try again"
      redirect_to root_path
    end
  end

  def github
    oauth_email = request.env['omniauth.auth']['info']['email']
    oauth_user = request.env['omniauth.auth']['info']['nickname']
    @user = User.find_or_create_by(email: oauth_email) do |user|
      user.username = oauth_user
      user.password = SecureRandom.hex(10)
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
  
end

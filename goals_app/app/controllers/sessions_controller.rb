class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['No loggy in']
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end

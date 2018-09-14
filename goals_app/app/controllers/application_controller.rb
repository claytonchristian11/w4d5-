class ApplicationController < ActionController::Base

  def login!(user)
    session[:session_token] = user.resets_session_token
  end

  def logout!
    user = current_user
    user.resets_session_token
    session[:session_token] = nil
    user.session_token = nil
  end

end

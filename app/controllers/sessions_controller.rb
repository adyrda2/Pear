class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    #persist user login through a session - store user id.
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end
end

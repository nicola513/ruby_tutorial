class SessionsController < ApplicationController
   def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect_to session[:return_to]
  end

  def destroy
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_path
    session[:return_to] = nil
  end
end

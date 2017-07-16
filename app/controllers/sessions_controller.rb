class SessionsController < ApplicationController
   def create
    if User.exists?(:uid=> env["omniauth.auth"].uid)
     session[:exists] = true
     user = User.find_by_uid(env["omniauth.auth"].uid)
    else
     session[:exists] = false
     user = User.from_omniauth(env["omniauth.auth"])
    end
    
    session[:user_id] = user.id
    session[:user_name] = user.name
    if session[:return_to]!=nil
     redirect_to session[:return_to]
    else
     redirect_to '/articles'
    end
  end

  def destroy
    session[:exists] = nil
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to root_path
    session[:return_to] = nil
  end
end

class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      sessions[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to users_new_url, alert:"Please sign in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert:"You have successfully signed out"
  end
end

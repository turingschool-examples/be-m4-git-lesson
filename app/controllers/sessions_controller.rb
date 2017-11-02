class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    session[:user_id] = user.id
    flash[:notice] = "Logged in as #{user.first_name}"
    redirect_to dashboard_path(id: user.id)
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

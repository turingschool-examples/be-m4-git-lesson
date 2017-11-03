class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to dashboard_path(id: user.id)
      flash[:notice] = "Logged in as #{user.first_name}"
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

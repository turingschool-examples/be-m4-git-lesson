class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    flash[:notice] = "Logged in as #{user.first_name}"
    redirect_to user_path(user)
  end
end

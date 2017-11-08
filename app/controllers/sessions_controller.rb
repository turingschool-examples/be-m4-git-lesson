class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if authenticated?(user, params)
      set_session(user)
      flash_login(user)
      redirect(user)
    else
      flash[:error] = "Unable to log in, please try again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def flash_login(user)
    flash[:success] = "Logged in as #{user.first_name}"
  end

  def set_session(user)
    session[:user_id] = user.id
  end

  def redirect(user)
    redirect_to dashboard_path(id: user.id) if user.default?
    redirect_to admin_dashboard_path if user.admin?
  end

  def authenticated?(user, params)
    user && user.authenticate(params[:session][:password])
  end
end

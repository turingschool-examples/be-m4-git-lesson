class UsersController < ApplicationController
  before_action :check_user, only: :show

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path(id: user.id)
      flash[:success] = "Logged in as #{user.first_name}"
    else
      flash[:notice] = "Unable to create account!"
      render :new
    end
  end

  def show
  end

  private

  def user_params
    params.require(:user).permit(:email, :last_name, :first_name, :address, :password)
  end

  def check_user
    redirect_to login_path if !current_user
  end
end
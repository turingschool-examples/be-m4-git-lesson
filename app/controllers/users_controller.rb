class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path(id: user.id)
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

end

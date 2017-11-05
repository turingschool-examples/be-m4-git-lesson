class Admin::UsersController < Admin::BaseController

  def show
    @admin = User.find(params[:id])
  end

  def edit
    @admin = User.find(params[:id])
  end

  def update
    @admin = User.find(params[:id])
    @admin.update(user_params)
    if @admin.save
      flash[:success] = "Profile successfully updated!"
      redirect_to admin_user_path(@admin)
    else
      flash[:notice] = "One or more of your credentials have already been taken!"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address, :role)
  end
end
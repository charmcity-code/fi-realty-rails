class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Sign up successful!"
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @appointments = Appointment.order('date ASC').limit(3)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end

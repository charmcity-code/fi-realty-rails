class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      render new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @appointments = Appointment.all
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

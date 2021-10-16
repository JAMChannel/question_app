class UsersController < ApplicationController
  # before_action :logged_in_user, only:[:edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # binding.pry
      redirect_to root_path
    else
      render new_user_path
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password , :image)
  end

end

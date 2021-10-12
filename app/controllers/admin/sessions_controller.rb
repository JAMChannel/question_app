class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) && user.admin == true
      # binding.pry
      log_in user
      redirect_to admin_questions_path
    else
      render 'new'
    end
  end
end

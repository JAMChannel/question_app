class Admin::QuestionsController < ApplicationController
  def index
    @questions = Question.includes(:user).order("created_at DESC").page(params[:page]).per(3)
  end


  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to admin_questions_path
  end
end
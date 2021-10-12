class QuestionsController < ApplicationController
  before_action :search_product, only: [:index, :unsolved, :solved]
  before_action :move_to_index, except: [:index, :show]
  def index
    @questions = Question.includes(:user).order("created_at DESC")
    @questions = @q.result.page(params[:page]).per(4)
    respond_to do |format|
      format.html
      format.js
      # binding.pry
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.valid?
      @question.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
    @comments = @question.comments.includes(:user)
    # binding.pry
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end

  def unsolved
    @questions = Question.where(solved: false).page(params[:page]).per(4)
  end

  def solved
    @questions = Question.where(solved: true).page(params[:page]).per(4)

  end


  private

  def question_params
    params.require(:question).permit(:title, :content ,:solved).merge(user_id: current_user.id)
  end

  def search_product
    @q = Question.ransack(params[:q])
  end

  def move_to_index
    unless logged_in?
      redirect_to action: :index
    end
  end

end

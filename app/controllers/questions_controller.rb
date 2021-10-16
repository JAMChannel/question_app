class QuestionsController < ApplicationController
  before_action :search_product, only: [:index, :unsolved, :solved]
  before_action :move_to_index, except: [:index, :show, :unsolved, :solved]
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  def index
    @questions = Question.includes(:user).order("created_at DESC")
    @questions = @q.result.page(params[:page]).per(4)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @users = User.where.not(id: current_user.id)
    if @question.save!
      CommentMailer.question_email(@question, @users).deliver_now
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new
    @comments = @question.comments.includes(:user)
    # binding.pry
  end

  def edit
    
  end

  def update
    if @question.update(question_params)
    redirect_to question_path(@question)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy!
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

  def set_question
    @question = Question.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless logged_in?
  end

end

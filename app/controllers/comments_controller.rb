class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    @user = User.where.not(id: current_user.id)
    CommentMailer.comment_email(@comment,@user).deliver_now
    redirect_to question_path(@comment.question_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id:current_user.id, question_id:params[:question_id])
  end
end

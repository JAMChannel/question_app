class CommentMailer < ApplicationMailer

  def question_email(question, user)
    @question = question
    @user = user
    mail_to = @user.pluck(:email)
    mail(
      subject: '質問者にて投稿がございます',
      to: mail_to,
      from: 'from@example.com'
    )
  end

  def comment_email(comment,user)
    @comment = comment
    @user = user
    mail_to = @user.pluck(:email)

    mail(
      subject: '回答者から返答がございます',
      to: mail_to,
      from: 'from@example.com'
    )
  end
end

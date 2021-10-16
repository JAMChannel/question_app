class CommentMailer < ApplicationMailer

  def question_email(question, users)
    @question = question
    @users = users
    mail_to = @users.pluck(:email)
    mail(
      subject: '質問者にて投稿がございます',
      to: mail_to,
      from: 'from@example.com'
    )
  end

  def comment_email(comment,users)
    @comment = comment
    @users = users
    mail_to = @users.pluck(:email)

    mail(
      subject: '回答者から返答がございます',
      to: mail_to,
      from: 'from@example.com'
    )
  end
end

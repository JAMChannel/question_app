# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview
  question = Question.new(title: "sss", user_id: 4 )
  CommentMailer.send_mail(question)
end

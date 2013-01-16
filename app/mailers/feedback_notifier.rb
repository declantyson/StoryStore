class FeedbackNotifier < ActionMailer::Base
  default from: "from@example.com"

  def feedback_email(user, feedback, url)
  	@user = user
  	@feedback = feedback
  	@url = url
  	mail(:to => user.email, :subject => "New feedback on #{@feedback.project.title}!")
  end

end

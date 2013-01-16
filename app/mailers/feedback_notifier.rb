class FeedbackNotifier < ActionMailer::Base
  default from: "from@example.com"

  def feedback_email(user)
  	@user = user
  	# @feedback = feedback
  	mail(:to => user.email, :subject => "test")
  end

end

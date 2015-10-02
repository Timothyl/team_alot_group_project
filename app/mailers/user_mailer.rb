class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def review_notification(user, reviewer, food_truck)
    @user = user
    @reviewer = reviewer
    @food_truck = food_truck
    mail(to: @user.email, subject: 'Your food truck has a new review!')
  end
end

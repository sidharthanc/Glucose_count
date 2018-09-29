class UserMailer < ApplicationMailer
	def welcome_email(user)
      @user = user
      #@url  = 'http://www.gmail.com'
      mail(to: @user.email, subject: 'Password Reset For Ehanu')
  end
end

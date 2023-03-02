class UserMailer < ApplicationMailer
    default from: "ror.book@gmail.com"

    def welcome_mail
        @user=params[:user]
        mail(to: @user.email, subject: "Welcome to ror-book!")
    end
end

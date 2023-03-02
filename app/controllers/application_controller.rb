class ApplicationController < ActionController::Base
    before_action :authenticate_user!


    def send_welcome_email
        UserMailer.with(user: @user).welcome_mail.deliver_now
    end
end

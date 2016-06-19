class RegistrationController < ApplicationController
  def register
  end

  def validate
    
    @username = params[:Username]
    @password = params[:Password]
    @user = User.new
    @user.username = @username
    @user.password = @password
    @user.save
    cookies[:username] = @username
    redirect_to '/forum/home'
  end
end

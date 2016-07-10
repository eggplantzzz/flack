class RegistrationController < ApplicationController
  def register
  end

  def validate
    @username = params[:Username]
    @password = params[:Password]
    @password_confirmation = params[:Password_confirmation]
    @user = User.new
    @user.username = @username
    @user.password = @password

    if @user.valid?
      @user.save
      redirect_to 'forum/home'
    else
      flash[:alert] = "Username already exists. Please choose a different one."
      redirect_to '/'
    end
  end
end

class RegistrationController < ApplicationController
  def register
  end

  def validate
    @username = params[:Username]
    @password = params[:Password]
    @user = User.new
    @user.username = @username
    @user.password = @password
    if @user.valid?
      @user.save
      redirect_to '/'
    else
      flash[:alert] = "Username already exists. Please choose a different one."
      redirect_to '/registration/register'
    end
  end
end

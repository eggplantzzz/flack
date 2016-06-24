class HomeController < ApplicationController
  def index
  end

  def login
    @username = params[:Username]
    @password = params[:Password]
    @user = User.new(username: @username, password: @password)

    # Find user that matches the username entered
    record = User.where(username: @username)

    # If it can't find the record, redirect to the log in page
    if record[0].nil?
      flash[:notice] = "That is not a valid user name. Please try again or register."
      redirect_to '/'
    else
      # See if the username and password matches a record in the database
      if @user.password == record[0].password
        session[:id] = record[0].id
        redirect_to '/forum/home'
      # If it doesn't match, send them back to the log in page
      else
        flash[:notice] = "That is not a valid user name. Please try again or register."
        redirect_to '/'
      end
    end

    def log_out
      session[:id] = ""
      redirect_to "/"
    end


  end
end

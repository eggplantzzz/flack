class ForumController < ApplicationController
  def home
  end

  def private_message
  end

  def send_private_message
    @username = params[:Username]
    @message = params[:Message]
    @sender = User.find(session[:id]).username
    @user = User.where(username: @username)[0]

    if @user.nil?
      flash[:alert] = "User does not exist."
      redirect_to '/forum/private_message'
    else
      @private_message = PrivateMessage.new
      @private_message.message = @message
      @private_message.user_id = User.where(username:@username)[0].id
      @private_message.sender = @sender
      @private_message.save
      redirect_to '/forum/home'
    end
  end

  def post_message
    @content = params[:content]
    @user = User.find(session[:id])
    @username = @user.username

    # If the user has not typed any input, do nothing
    if @content.nil? || @content == ""
      redirect_to '/forum/home'
    # otherwise create a new message in the db
    else
      @new_message = Message.new
      @new_message.content = @content
      @new_message.user = @user
      @new_message.save
      redirect_to '/forum/home'
    end
  end
end

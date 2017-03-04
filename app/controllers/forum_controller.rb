class ForumController < ApplicationController
  def home
    @users = User.all
  end

  def private_message
  end

  def send_private_message
    @email = params[:email]
    @message = params[:message]
    @sender = User.find(session[:id]).email

    if current_user.nil?
      flash[:alert] = "User does not exist."
      redirect_to '/forum/private_message'
    else
      @private_message = PrivateMessage.new
      @private_message.message = @message
      @private_message.user_id = User.where(email: @email)[0].id
      @private_message.sender = @sender
      @private_message.save
      redirect_to '/forum/home'
    end
  end

  def delete_private_message
    private_message_id = params[:private_message_id].to_i
    private_message = PrivateMessage.find(private_message_id)
    if !(private_message == nil)
      private_message.destroy
    end
      redirect_to '/settings/settings'
  end

  def post_message
    @content = params[:content]
    @user = current_user
    @email = @user.email

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

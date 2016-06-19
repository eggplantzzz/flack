class ForumController < ApplicationController
  def home
  end

  def post_message
    @content = params[:content]
    @username = session[:username]
    # If the user has not typed any input, do nothing
    if @content.nil? || @content == ""
      redirect_to '/forum/home'
    # otherwise create a new message in the db
    else
      @new_message = Message.new
      @new_message.content = @content
      @new_message.username = @username
      @new_message.save
      redirect_to '/forum/home'
    end
  end
end

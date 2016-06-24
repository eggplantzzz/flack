class SettingsController < ApplicationController
  def settings
    @private_messages = []
    PrivateMessage.all.each do |private_message|
      if private_message.user_id == session[:id]
        @private_messages << private_message
      end
    end
  end

  def show_private_message
    @private_message_id = params[:private_message_id]
    redirect_to '/settings/settings?display_private_message=true'
  end
end

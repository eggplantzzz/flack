class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to '/forum/home'
    end
  end
end

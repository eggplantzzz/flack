require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    before do
      allow(controller).to receive(:user_signed_in?).and_return(true)
    end
    it "returns http success" do
      get :index
      expect(response).to redirect_to('/forum/home')
    end
  end

end

require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    context 'when the user is signed in' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(true)
      end
      it "returns http success" do
        get :index
        expect(response).to redirect_to('/forum/home')
      end
    end

    context 'when the user is not signed in' do
      before do
        allow(controller).to receive(:user_signed_in?).and_return(false)
      end

      it 'renders the log in view' do
        get :index
        expect(response).to render_template('home/index')
      end
    end
  end
end

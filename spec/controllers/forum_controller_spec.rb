require 'rails_helper'

RSpec.describe ForumController, type: :controller do

  describe "#home()" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it 'gets all the users' do
      expect(User).to receive(:all)
      controller.home
    end
  end

  describe '#send_private_message()' do
    let(:sender) { User.create(email: 'ulla@ulla.com', password: 'asdfasdf') }
    let(:recipient) { User.create(email: 'gobble@gobble.com', password: 'blahblah') }
    let(:params) do
      {
        email: sender.email,
        message: 'hi God'
      }
    end
    let(:session) do
      { id: sender.id }
    end

    before do
      allow(controller).to receive(:session).and_return(session)
    end

    describe 'when the user does not exist' do
      before do
        allow(User).to receive(:where).and_return([])
      end

      it 'redirects to the private message view' do
        get :send_private_message, params
        expect(response).to redirect_to('/forum/private_message')
      end
    end
  end
end

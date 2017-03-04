require 'rails_helper'

RSpec.describe ForumController, type: :controller do

  describe "#home()" do
    it "returns http success" do
      controller.home
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
      allow(User).to receive(:find).and_return(sender)
    end

    it 'looks up the sender' do
      expect(User).to receive(:find).with(session[:id].to_i)
      controller.send_private_message
    end
  end
end

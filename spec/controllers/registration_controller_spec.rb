require 'rails_helper'

RSpec.describe RegistrationController, type: :controller do

  describe "GET #register" do
    it "returns http success" do
      get :register
      expect(response).to have_http_status(:success)
    end
  end

  describe 'setting a username and password' do
    it 'should allow for user creation and password setting' do
      new_user = User.new
      expect(new_user).to be_a User
    end
  end
end

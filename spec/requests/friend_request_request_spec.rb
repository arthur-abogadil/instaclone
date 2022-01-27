require 'rails_helper'

RSpec.describe "FriendRequests", type: :request do

  describe "GET /accept_request" do
    it "returns http success" do
      get "/friend_request/accept_request"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /send_request" do
    it "returns http success" do
      get "/friend_request/send_request"
      expect(response).to have_http_status(:success)
    end
  end

end

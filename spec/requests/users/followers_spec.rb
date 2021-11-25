require 'rails_helper'

RSpec.describe "Users::Followers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/followers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users/followers/create"
      expect(response).to have_http_status(:success)
    end
  end

end

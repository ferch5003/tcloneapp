require 'rails_helper'

RSpec.describe "Users::Follows", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/follows/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users/follows/create"
      expect(response).to have_http_status(:success)
    end
  end

end

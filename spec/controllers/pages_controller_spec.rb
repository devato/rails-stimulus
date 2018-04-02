require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #features" do
    it "returns http success" do
      get :features
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #pricing" do
    it "returns http success" do
      get :pricing
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #docs" do
    it "returns http success" do
      get :docs
      expect(response).to have_http_status(:success)
    end
  end

end

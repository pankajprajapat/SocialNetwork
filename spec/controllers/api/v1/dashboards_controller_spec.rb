require "rails_helper"

RSpec.describe Api::V1::DashboardsController, :type => :controller do
  describe "GET index status" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET index type" do
    it "has JSON content type" do
      get :index
      expect(response.content_type).to eq "application/json; charset=utf-8"
    end
  end

  describe "GET index response" do
    it "has response" do
      get :index
      expect(response.body).kind_of? Hash
    end
  end
end

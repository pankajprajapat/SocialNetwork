require "rails_helper"

RSpec.describe Api::V1::PostsController, :type => :controller do
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
      expect(response.body).to eq({"twitter":[{"username":"@GuyEndoreKaiser","tweet":"If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day."},{"username":"@mikeleffingwell","tweet":"STOP TELLING ME YOUR NEWBORN'S WEIGHT AND LENGTH I DON'T KNOW WHAT TO DO WITH THAT INFORMATION."}],"facebook":[{"name":"Some Friend","status":"Here's some photos of my holiday. Look how much more fun I'm having than you are!"},{"name":"Drama Pig","status":"I am in a hospital. I will not tell you anything about why I am here."}],"instagram":[]}.to_json)
    end
  end
end

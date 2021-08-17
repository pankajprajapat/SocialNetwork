require 'rails_helper'

describe TakeHome do
  it "returns tweets when the API call is made" do
    response = TakeHome.new('twitter').get_data
    expect(response).to_not(eq(nil))
  end

  it "returns fb posts when the API call is made" do
    response = TakeHome.new('facebook').get_data
    expect(response).to_not(eq(nil))
  end

  it "fb post check" do
    response = TakeHome.new('facebook').get_data
    expected = [
      {"name"=>"Some Friend", "status"=>"Here's some photos of my holiday. Look how much more fun I'm having than you are!"},
      {"name"=>"Drama Pig", "status"=>"I am in a hospital. I will not tell you anything about why I am here."}
    ]
    expect(response).to eq expected
  end

  it "twitter post check" do
    response = TakeHome.new('twitter').get_data
    expected = [
      {"username"=>"@GuyEndoreKaiser", "tweet"=>"If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day."},
      {"username"=>"@mikeleffingwell", "tweet"=>"STOP TELLING ME YOUR NEWBORN'S WEIGHT AND LENGTH I DON'T KNOW WHAT TO DO WITH THAT INFORMATION."}
    ]
    expect(response).to eq expected
  end

  it "response should not be a string" do
    response = TakeHome.new('twitter').get_data
    expect(response.is_a? String).to eq false
  end

  it "twitter response should have valid JSON" do
    response = TakeHome.new('twitter').get_data
    expect(response.first.keys).to eq TakeHome::TWITTER_KEYS
  end

  it "fb response should have valid JSON" do
    response = TakeHome.new('facebook').get_data
    expect(response.first.keys).to eq TakeHome::FACEBOOK_KEYS
  end
end

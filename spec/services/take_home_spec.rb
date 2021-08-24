require 'rails_helper'
require 'webmock/rspec'

describe TakeHome do
  let(:base_uri) { 'https://takehome.io' }
  let(:twitter_response_body) { File.open('./spec/fixtures/twitter_response_body.json') }

  it "returns tweets when the API call is made" do
    stub_request(:get, "#{base_uri}/twitter").to_return( body: twitter_response_body, status: 200)
    response = described_class.new('twitter').get_data
    expect(response).to_not(eq(nil))
  end

  it "returns fb posts when the API call is made" do
    stub_request(:get, "#{base_uri}/facebook").to_return( body: twitter_response_body, status: 200)
    response = described_class.new('facebook').get_data
    expect(response).to_not(eq(nil))
  end

  it "fb post check" do
    stub_request(:get, "#{base_uri}/facebook").to_return( body: twitter_response_body, status: 200)
    response = described_class.new('facebook').get_data
    expect(response).kind_of? Hash
  end

  it "twitter post check" do
    stub_request(:get, "#{base_uri}/twitter").to_return( body: twitter_response_body, status: 200)
    response = described_class.new('twitter').get_data
    expect(response).kind_of? Hash
  end

  it "response should not be a string" do
    stub_request(:get, "#{base_uri}/twitter").to_return( body: twitter_response_body, status: 200)
    response = described_class.new('twitter').get_data
    expect(response.is_a? String).to eq false
  end
end

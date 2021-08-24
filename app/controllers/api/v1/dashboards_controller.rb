class Api::V1::DashboardsController < ActionController::API
  def index
    tweets = TakeHome.new('twitter').get_data
    fb_posts = TakeHome.new('facebook').get_data
    render json: { twitter: tweets, facebook: fb_posts, instagram: [] }.to_json, status: :ok
  end
end

class TakeHome
  include HTTParty
  base_uri 'https://takehome.io'
  TWITTER_KEYS = ["username", "tweet"]
  FACEBOOK_KEYS = ["name", "status"]

  def initialize(service)
    @service = service
  end

  def get_data
    # retry until get a response from server
    retry_count = 0
    begin
      response = HTTParty.get("#{TakeHome.base_uri}/#{@service}")
      if response.code == 200
        return JSON.parse(response.body)
      else
        raise Error
      end
    rescue Exception
      retry_count += 1
      retry if retry_count <= 3
    end
    return false
  end

  private

  def check_keys
    if @service == "facebook"
      FACEBOOK_KEYS
    elsif @service == "twitter"
      TWITTER_KEYS
    else
      []
    end
  end
end

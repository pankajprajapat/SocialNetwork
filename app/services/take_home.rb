class TakeHome
  include HTTParty
  base_uri 'https://takehome.io'

  def initialize(service)
    @service = service
  end

  def get_data
    # retry until get a response from server
    begin
      response = HTTParty.get("#{TakeHome.base_uri}/#{@service}")
      if response.code == 200
        JSON.parse(response.body)
      else
        raise Error
      end
    rescue
      retry
    end
  end
end

class TakeHome
  include HTTParty
  base_uri 'https://takehome.io'

  def initialize(service)
    @service = service
  end

  def get_data
    # retry until get a response from server
    retry_count = 0
    begin
      response = HTTParty.get("#{TakeHome.base_uri}/#{@service}")
      if response.code == 200
        JSON.parse(response.body)
      else
        raise Error
      end
    rescue
      retry_count += 1
      retry if retry_count <= 3
    end
  end
end

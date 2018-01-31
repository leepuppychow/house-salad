class PropublicaService

  def initialize(state)
    @state = state
  end

  def house_members
    get_json("/congress/v1/members/house/#{state}/current.json")[:results]
  end

  private
    attr_reader :state

    def conn
      Faraday.new(:url => 'https://api.propublica.org') do |faraday|
        #this is how you pass in a key through the header in Faraday
        faraday.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end

end

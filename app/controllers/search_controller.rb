class SearchController < ApplicationController

  def index
    conn = Faraday.new(:url => 'https://api.propublica.org') do |faraday|
      faraday.headers['X-API-Key'] = ENV["PROPUBLICA_API_KEY"]
      #this is how you pass in a key through the header in Faraday
      faraday.adapter Faraday.default_adapter
    end
    response = conn.get("/congress/v1/members/house/CO/current.json")
    @search = MemberSearch.new(JSON.parse(response.body))
  end

end

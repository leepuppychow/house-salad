class SearchController < ApplicationController

  def index
    @search = MemberSearch.new(params[:state])
  end

end

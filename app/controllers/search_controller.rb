class SearchController < ApplicationController
  def index
    @search_facade = SearchFacade.new(search_params)
  end

  private

  def search_params
    params.permit(:q)
  end
end

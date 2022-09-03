class SearchController < ApplicationController
  def index
    search_result = Autocompleter.call(params[:query].to_s)
    render json: search_result, status: :found
  end
end

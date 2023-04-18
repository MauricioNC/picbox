class SearchController < ApplicationController
  def search
    @search_response = Image.search(params[:t])
  end
end

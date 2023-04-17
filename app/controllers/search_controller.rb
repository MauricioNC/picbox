class SearchController < ApplicationController
  def search
    @search_response = Image.search(params[:t])
    pp @search_response
  end
end

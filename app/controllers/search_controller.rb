class SearchController < ApplicationController
  before_action :authorized
  def search
    @search_response = Image.search(params[:t])
  end
end

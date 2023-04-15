class SearchController < ApplicationController
  def search
    session[:search_results] = Image.search(params[:t])

    if session[:search_results].nil?
      flash[:error] = "No records found"
      redirect_to root_path
      return
    else
      redirect_to search_results_path(params[:t])
    end
  end

  def search_results
    @search_results = session[:search_results]
  end
end

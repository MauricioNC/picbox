class HomeController < ApplicationController
  before_action :authorized
  def index
    @images = Image.all
    @tags = Tag.all
  end
end

class HomeController < ApplicationController
  def index
    @images = Image.all
    @tags = Tag.all
  end
end

class HomeController < ApplicationController
  def index
    @games = Game.limit(14)
    @platforms = Platform.limit(14)
  end
end

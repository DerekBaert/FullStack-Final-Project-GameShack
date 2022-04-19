class HomeController < ApplicationController
  def index
    @games = Game.order(created_at: :desc).limit(21)
    @platforms = Platform.limit(15)
  end
end

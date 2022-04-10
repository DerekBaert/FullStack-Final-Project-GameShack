class HomeController < ApplicationController
  def index
    @games = Game.order(created_at: :desc).limit(14)
    @platforms = Platform.limit(14)
  end
  
  def cart
  end
end

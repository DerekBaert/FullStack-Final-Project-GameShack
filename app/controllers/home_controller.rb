class HomeController < ApplicationController
  def index
    @games = Game.order(created_at: :desc).limit(15)
    @platforms = Platform.limit(15)
  end
  
  def cart
  end

  def sale
    @games = Game.where.not(sale: nil)
    @platforms = Platform.where.not(sale: nil)
  end
end

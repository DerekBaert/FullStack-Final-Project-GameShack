class SearchController < ApplicationController
    def index
        if(params[:platforms] == "All")
            @games = Game.search(params[:search]).page(params[:page])
        else            
            @games = Game.joins(:game_platforms).where(Game_platforms: {Platform_id: params[:platforms]}).search(params[:search]).page(params[:page])
        end        
    end
end

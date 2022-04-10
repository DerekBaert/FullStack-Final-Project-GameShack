class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :initialize_session, :load_cart

    def add_game_to_cart
        id = params[:id].to_i

        session[:cart_games] << id unless session[:cart_games].include?(id)
        redirect_to request.referrer
    end

    def add_platform_to_cart
        id = params[:id].to_i

        session[:cart_platforms] << id unless session[:cart_platforms].include?(id)
        redirect_to request.referrer  
    end

    def load_cart
        @cart = Game.find(session[:cart_games])
        @cart += Platform.find(session[:cart_platforms])
    end
    
    def remove_game_from_cart
        id = params[:id].to_i
        session[:cart_games].delete(id)
        redirect_to request.referrer  
    end

    def remove_platform_from_cart
        id = params[:id].to_i
        session[:cart_platforms].delete(id)
        redirect_to request.referrer  
    end
    private

    def initialize_session
        session[:cart_platforms] ||= []
        session[:cart_games] ||= []
    end
end

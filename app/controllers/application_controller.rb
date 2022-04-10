class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :initialize_session, :load_cart

    def add_game_to_cart
        if(session[:cart_games].keys.include? params[:id])
            session[:cart_games][params[:id]] +=  1
        else
            session[:cart_games][params[:id]] = 1
        end        
        redirect_to request.referrer
    end

    def add_platform_to_cart
        if(session[:cart_platforms].keys.include? params[:id])
            session[:cart_platforms][params[:id]] +=  1
        else
            session[:cart_platforms][params[:id]] = 1
        end        
        redirect_to request.referrer  
    end

    def load_cart
        @cart = Game.find(session[:cart_games].keys)
        @cart += Platform.find(session[:cart_platforms].keys)

        @cart_count = 0
        session[:cart_games].each do |k, v|
            @cart_count += v
        end

        session[:cart_platforms].each do |k, v|
            @cart_count += v
        end
    end
    
    def remove_game_from_cart
        session[:cart_games].delete(params[:id])
        redirect_to request.referrer  
    end

    def remove_platform_from_cart
        session[:cart_platforms].delete(params[:id])
        redirect_to request.referrer  
    end

    def update_game_quantity
        session[:cart_games][params[:id]] = params[:quantity].to_i
        redirect_to request.referrer 
    end

    def update_platform_quantity
        session[:cart_platforms][params[:id]] = params[:quantity].to_i
        redirect_to request.referrer 
    end
    
    private

    def initialize_session
        session[:cart_platforms] ||= {}
        session[:cart_games] ||= {}
    end
end

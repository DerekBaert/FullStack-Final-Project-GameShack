class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :initialize_session, :load_cart
    before_action :configure_permitted_parameters, if: :devise_controller?

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

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :address, :postal, :province_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password, :address, :postal, :province_id])
    end
end

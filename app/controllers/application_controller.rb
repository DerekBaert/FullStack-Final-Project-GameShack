class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :initialize_session, :load_cart
    before_action :configure_permitted_parameters, if: :devise_controller?

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

        if(@cart_count != 0)
            calculate_total()
        end        
    end
    
    def calculate_total
        @sub = 0
        @tax_rate = 0

        if(user_signed_in?)
            province = current_user.province
            @tax_rate += province.gst unless province.gst.nil?
            @tax_rate += province.pst unless province.pst.nil?
            @tax_rate += province.hst unless province.hst.nil?
        end

        @cart.each do |p|
            @sub += p.price
        end
        @tax = @sub * @tax_rate
        @total = @sub + @tax
    end

    def remove_game_from_cart
        session[:cart_games].delete(params[:id])
        load_cart()
        redirect_to cart_path  
    end

    def remove_platform_from_cart
        session[:cart_platforms].delete(params[:id])
        load_cart()
        redirect_to cart_path 
    end

    def update_game_quantity
        session[:cart_games][params[:id]] = params[:quantity].to_i
        load_cart()
        redirect_to cart_path 
    end

    def update_platform_quantity
        session[:cart_platforms][params[:id]] = params[:quantity].to_i
        load_cart()
        redirect_to cart_path
    end
    
    private

    def initialize_session
        session[:cart_platforms] ||= {}
        session[:cart_games] ||= {}
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :address, :postal, :province_id])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password, :address, :postal, :province_id])
    end
end

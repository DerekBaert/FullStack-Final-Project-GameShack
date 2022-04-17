class CheckoutController < ApplicationController
    def create
        require 'faker'
        if(@cart.nil?)
            redirect_to root_path
        end

        order = Order.new(
            number: Faker::Number.between(from: 1000, to: 10000),
            price: @total,
            tax: @tax,
            status_id: 1,
            user_id: current_user.id
        )
        order.save
        @cart.each do |p|
            price = 0
            if(p.sale)
                price = (p.price - (p.price * p.sale)).round(2)
            else
                price = p.price
            end
            if(p.is_a? Game)                
                item = GameOrder.new(game_id: p.id, order_id: order.id, quantity: session[:cart_games][p.id.to_s], price: price)
                item.save
            else
                item = PlatformOrder.new(platform_id: p.id, Order_id: order.id, Quantity: session[:cart_platforms][p.id.to_s], price: price)
                item.save
            end
        end
        
        redirect_to order_path(order.id)
        
        description = ""

        @cart.each do |p|
            description += "#{p.name}\n"
        end

        # Setting up Stripe for payment
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                        name: "GameShack Order",
                        description: description,
                        amount: (@total * 100).to_i,
                        currency: 'cad',
                        quantity: @cart_count
            }],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url
        )

        respond_to do |format|
            format.js # render a create.js.erb
        end        
    end

    def success

    end

    def cancel

    end
end

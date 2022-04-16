class CheckoutController < ApplicationController
    def create
        require 'faker'
        if(@cart.nil?)
            redirect_to root_path
        end

        order = Order.new(
            number: Faker::Number.between(from: 1000, to: 10000),
            price: @total,
            status_id: 1,
            user_id: current_user.id
        )
        order.save

        
        name = ""

        @cart.each do |p|
            name += "#{p.name}\n"
        end

        # Setting up Stripe for payment
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                        name: "Order from Gameshack",
                        description: name,
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

class OrdersController < InheritedResources::Base

  private

    def order_params
      params.require(:order).permit(:number, :price, :status_id, :user_id)
    end

end

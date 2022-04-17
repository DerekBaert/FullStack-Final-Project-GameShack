class OrdersController < InheritedResources::Base

  def index
    @orders = Order.where(user_id: current_user.id).page(params[:page])
  end
  private

    def order_params
      params.require(:order).permit(:number, :price, :status_id, :user_id)
    end

end

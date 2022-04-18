ActiveAdmin.register Order do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :number, :price, :status_id, :user_id, game_orders: [:id, :game_id, :order_id, :_destroy], platform_orders: [:id, :platform_id, :Order_id, :_destroy]
  #
  # or
  #
  index do 
    selectable_column
    column :id
    column :name
    column :user
    column :price
    column :tax
    column :games do |order|
      order.games.map {|o| o.name}.join(", ").html_safe
    end
    column :platforms do |order|
      order.platforms.map {|o| o.name}.join(", ").html_safe
    end
  end

  show do |order|
    attributes_table do
      row :id
      row :number
      row :user
      row :price
      row :tax
      row :games do |order|
        order.games.map {|o| o.name}.join(", ").html_safe
      end
      row :platforms do |order|
        order.platforms.map {|o| o.name}.join(", ").html_safe
      end
    end
  end

  form do |f|
    #f.object.added_date = DateTime.now unless f.object.persisted?
    f.inputs
    f.inputs do
      f.has_many :game_orders, allow_destroy: true do |n_f|
        n_f.input :game
        n_f.input :quantity
        n_f.input :price
      end
      f.has_many :platform_orders, allow_destroy: true do |n_f|
        n_f.input :platform
        n_f.input :Quantity
        n_f.input :price
      end
    end
    f.actions
  end
end

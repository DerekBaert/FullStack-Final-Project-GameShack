ActiveAdmin.register Game do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
 permit_params :name, :description, :price, :age_rating, :image, :sale
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :price, :age_rating]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    #f.object.added_date = DateTime.now unless f.object.persisted?
    f.inputs
    f.inputs do
      f.input :image, as: :file,
                     hint: f.object.image.present? ? image_tag(f.object.image, width: '200') : ""
    end
    f.actions
  end
end

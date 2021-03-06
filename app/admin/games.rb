ActiveAdmin.register Game do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
 permit_params :name, :description, :price, :age_rating, :image, :sale, game_genres_attributes: [:id, :game_id, :genre_id, :_destroy], game_platforms_attributes: [:id, :game_id, :platform_id, :_destroy]
  #
  # or
  #
  index do 
    selectable_column
    column :id
    column :name
    column :description
    column :price
    column :age_rating
    column :sale
    column :genres do |game|
      game.genres.map {|g| g.name}.join(", ").html_safe
    end
    column :platforms do |game|
      game.platforms.map {|g| g.name}.join(", ").html_safe
    end
    actions
  end

  show do |game|
    attributes_table do
      row :id
      row :name
      row :description
      row :price
      row :age_rating
      row :sale
      row :genres do |game|
        game.genres.map {|g| g.name}.join(", ").html_safe
      end
      row :platforms do |game|
        game.platforms.map {|g| g.name}.join(", ").html_safe
      end
    end
  end

  form do |f|
    #f.object.added_date = DateTime.now unless f.object.persisted?
    f.inputs
    f.inputs do
      f.has_many :game_genres, allow_destroy: true do |n_f|
        n_f.input :genre
      end
      f.has_many :game_platforms, allow_destroy: true do |n_f|
        n_f.input :platform
      end
      f.input :image, as: :file,
                     hint: f.object.image.present? ? image_tag(f.object.image, width: '200') : ""
    end
    f.actions
  end
end

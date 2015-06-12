RailsAdmin.config do |config|

  ### Popular gems integration
  config.authenticate_with do
    warden.authenticate! scope: :account
  end
  config.current_user_method(&:current_account)
  # ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

 config.actions do
    dashboard                      # mandatory
    index 
    new
    # export
    # bulk_delete
    show
    edit
    # show_in_app
    delete 
  # config action end
  # config field to show in action

  # config for plants
    config.model Plant do
    create do
      include_all_fields
      exclude_fields :delete_flag
      field :description, :ck_editor
    end
    edit do
      include_all_fields
      exclude_fields :delete_flag, :plant_images
      field :description, :ck_editor
    end
    list do
      include_all_fields
      exclude_fields  :updated_at , :categories
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    show do
      include_all_fields
      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
  end

  config.model Account do
    create do
      include_all_fields
      exclude_fields  :roles, :post_sells, :posts
    end
    edit do
       include_all_fields
       exclude_fields  :posts, :post_sells
       field :admin do
        visible do
            bindings[:view]._current_user.roles.include?(:member)
        end
      end

    end
    list do
      include_all_fields
      field :image do
        thumb_method :thumbnail
      end
      exclude_fields  :updated_at, :admin, :id, :created_at,:post_sells
    end
  end

    # config for Contact
  config.model Contact do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
       exclude_fields  :created_at, :updated_at, :id
    end
  end

  config.model Role do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
       exclude_fields  :created_at, :updated_at, :accounts, :id
    end
  end

  # Config for Category
  config.model Category do
    create do
      include_all_fields
      exclude_fields  :plants
      field :description, :ck_editor
    end
    edit do
      include_all_fields
      exclude_fields  :plants
      field :description, :ck_editor
    end
    list do
      include_all_fields
      exclude_fields  :created_at, :updated_at , :plants
      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
    show do
      include_all_fields

      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
  end

  # Config for Post
  config.model Post do
    create do
      include_all_fields
      exclude_fields :ratings
      field :description, :ck_editor
    end
    edit do
      include_all_fields
      exclude_fields :ratings
      field :description, :ck_editor
    end
    list do
      include_all_fields
      exclude_fields  :created_at, :updated_at, :description
      field :image do
        thumb_method :thumbnail
      end
    end
    show do
      include_all_fields

      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
  end

  # Config for Post_Sells
  config.model PostSell do
    list do
      include_all_fields
      exclude_fields  :created_at, :updated_at
      field :image do
        thumb_method :thumbnail
      end
      field :description do
        pretty_value do
          value.html_safe
        end
      end
    end
    show do
      include_all_fields

      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
  end
  # Config for Shop
  config.model Shop do
    edit do
      exclude_fields :delete_flag
      field :township, :enum do
        enum_method do
          :my_shop_enum_instance_method
        end

        enum do
          ["Quận Cẩm Lệ" ,"Quận Sơn Trà" ,"Quận Ngũ Hành Sơn " ,"Quận Hải Châu" ,"Quận Thanh Khê" ,"Quận Liên Chiểu"]
        end
      end
      include_all_fields
    end
    list do
      include_all_fields
      exclude_fields  :created_at, :updated_at, :id
      field :image do
        thumb_method :thumbnail
      end
      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
    show do
      include_all_fields

      field :description do
        pretty_value do
          value.html_safe
        end
     end
    end
  end

  # Config for Plant_image
  config.model PlantImage do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
      exclude_fields  :created_at, :updated_at, :id, :description
      field :image do
        thumb_method :thumbnail
      end
    end
  end
end
end

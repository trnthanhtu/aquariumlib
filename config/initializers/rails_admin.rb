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
    index do                        # mandatory
      controller do
        proc do
          @objects = @abstract_model.where('isnull(delete_flag) or delete_flag = 0').order('created_at desc')
        end
      end
    end
    new
    # export
    # bulk_delete
    show
    edit
    # show_in_app
    delete do
      controller do
        proc do
          if request.delete? # delete
            @object.delete_flag =1

            @object.set_attributes(params[@abstract_model.param_key])
            @authorization_adapter && @authorization_adapter.attributes_for(:destroy, @abstract_model).each do |name, value|
              @object.send("#{name}=", value)
            end

            if @object.save
              @auditing_adapter && @auditing_adapter.create_object(@object, @abstract_model, _current_user)
              respond_to do |format|
                format.html { redirect_to_on_success }
                format.js   { render json: {id: @object.id.to_s, label: @model_config.with(object: @object).object_label} }
              end
            else
              handle_save_error
            end
          end
        end
      end
    end
  # config action end
  # config field to show in action

  # config for plants
    config.model Plant do
    create do
      include_all_fields
      exclude_fields :delete_flag
      field :description, :ck_editor
    end
    list do
      include_all_fields
      exclude_fields :delete_flag, :updated_at , :id
    end
  end

  config.model Account do
    # field :roles do
    #   inverse_of :roles
    # end
    create do
      include_all_fields
      exclude_fields :delete_flag, :roles
      # field :description, :ck_editor
    end
    edit do
       include_all_fields
       exclude_fields :delete_flag
       field :admin do
        visible do
            bindings[:view]._current_user.roles.include?(:member)
          # current_user.roles.include?(:super_admin) # metacode
        end
      end

    end
    list do
      include_all_fields
      exclude_fields :delete_flag, :updated_at, :admin, :id
    end
  end

  # config for technical
    config.model Plant do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
      exclude_fields :delete_flag, :updated_at, :id
    end
  end

  #config for rating
  config.model Rating do
    list do
      include_all_fields
      exclude_fields :delete_flag, :id
    end

    edit do
      include_all_fields
      exclude_fields :delete_flag
      field :point, :enum do
        enum_method do
          :my_rating_enum_instance_method
        end

        enum do
          [1,2,3,4,5]
        end
      end
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
       exclude_fields :delete_flag, :created_at, :updated_at, :id
    end
  end

  config.model Role do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
       exclude_fields :delete_flag, :created_at, :updated_at, :accounts, :id
    end
  end


  # Config for Post
  config.model Post do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
       exclude_fields :delete_flag, :created_at, :updated_at, :id
    end
  end

  # Config for Shop
  config.model Shop do
    edit do
      include_all_fields
      exclude_fields :delete_flag
    end
    list do
      include_all_fields
       exclude_fields :delete_flag, :created_at, :updated_at, :id
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
       exclude_fields :delete_flag, :created_at, :updated_at, :id
    end
  end
end
end

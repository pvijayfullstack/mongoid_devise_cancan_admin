class RegistrationsController < Devise::RegistrationsController
  
  def new
    if can? :manage, User
      super
    else
      flash[:failure] = "Registration is not allowed" 
      redirect_to root_path      
    end
  end
  
  def create
    build_resource

    if resource.save
      set_flash_message :notice, :signed_up
      redirect_to after_sign_up_path_for(resource)
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end
  
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    if resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated if is_navigational_format?
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      respond_with_navigational(resource){ render_with_scope :edit }
    end
  end
  
  protected
  
    def stored_location_for(resource)
      nil
    end
  
    def after_sign_in_path_for(resource)
      projects_path
    end
   
    def after_sign_up_path_for(resource)
      dashboard_index_path
    end
    
    def after_update_path_for(resource)
      dashboard_index_path
    end
  
end
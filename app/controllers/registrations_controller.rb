class RegistrationsController < Devise::RegistrationsController
  
  load_and_authorize_resource
  
  def create
    resource.build
    if resource.save
      if resource.active?
        set_flash_message :notice, :signed_up
        sign_in_and_redirect(resource_name, resource)
      else
        set_flash_message :notice, :inactive_signed_up, :reason => resource.inactive.message.to_s
        expire_session_data_after_sign_in!
        redirect_to after_sign_up_path_for(resource)
      end
    else
      clean_up_passwords(resource)
      render_with_scope :new
    end
  end
  
end
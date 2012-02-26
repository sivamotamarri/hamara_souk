class Users::RegistrationsController < Devise::RegistrationsController
  # PUT /resource
  # We need to use a copy of the resource because we don't want to change
  # the current user in place.
#  def update
#    
#    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
#  
#    if resource.update_with_password(params[resource_name])
#      set_flash_message :notice, :updated if is_navigational_format?
#      sign_in resource_name, resource, :bypass => true
#      respond_with resource, :location => after_update_path_for(resource)
#    else
#      clean_up_passwords(resource)
#      respond_with_navigational(resource){ render_with_scope :edit }
#    end
#  end
end
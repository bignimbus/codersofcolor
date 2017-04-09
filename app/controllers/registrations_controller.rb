class RegistrationsController < Devise::RegistrationsController

 def create
  super
 end

 def new
  super
 end

 def update
  super
 end

 def destroy
  super
 end

 protected

  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

end

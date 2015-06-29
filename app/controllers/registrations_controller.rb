class RegistrationsController < Devise::RegistrationsController

 def create
  #  invite_code = params[:invite_code]
  #  if invite_code == 'linkedhearts'
     super
  #  else
    # redirect_to new_user_registration_path, :notice => 'Your invitation code is not valid'
    # end
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

end

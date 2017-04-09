module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:email,:password,:password_confirmation,:first_name,:last_name, :role)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:email,:password,:password_confirmation,:first_name,:last_name,:bio,:website,:field,:role,:avatar,:twitter)
    end
  end

end

DeviseController.send :include, DevisePermittedParameters

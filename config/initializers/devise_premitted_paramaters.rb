module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_filter :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit({field:[]},:first_name ,:last_name ,:website ,:twitter ,:bio ,:avatar ,:password ,:password_confirmation)}
    devise_parameter_sanitizer.for(:account_update)   { |u| u.permit({field:[]},:first_name ,:last_name ,:website ,:twitter ,:bio ,:avatar ,:password ,:password_confirmation)}
  end

end

DeviseController.send :include, DevisePermittedParameters

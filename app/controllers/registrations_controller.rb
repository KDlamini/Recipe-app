class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource_name)
    flash[:notice] = 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    session_path(resource_name)
  end

  def after_inactive_sign_up_path_for(resource_name)
    flash[:notice] = 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    session_path(resource_name)
  end
end
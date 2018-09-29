class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   include ActiveDevice
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
      devise_parameter_sanitizer.for(:account_update) << :name
  end
=begin
  def after_admin_sign_in_path_for(resource)
    admin_path
  end
  def after_patient_sign_in_path_for(resource)
    patient_path
  end
=end
  def after_doctor_sign_in_path_for(resource)
    doctor_path
  end

  def after_pharmacy_sign_in_path_for(resource)
    pharmacy_path
  end

  def after_patient_sign_in_path_for(resource)
    patient_path
  end

  def after_admin_sign_in_path_for(resource)
     admin_path
   end

   def after_role_sign_in_path_for(resource) 
     role_path
   end



end

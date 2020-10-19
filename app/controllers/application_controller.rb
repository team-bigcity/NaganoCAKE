class ApplicationController < ActionController::Base
  
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number])
  # end
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number)}
  # end
  # protected
 
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number])
  # end
 
  # def devise_parameter_sanitizer
  #   if resource_class == Customer
  #     Customer::ParameterSanitizer.new(Customer, :customer, params)
  #   else
  #     super # Use the default one
  #   end
  # end
end

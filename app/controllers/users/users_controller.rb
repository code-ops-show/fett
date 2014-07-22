class Users::RegistrationsController < Devise::RegistrationsController
	before_action :configure_permitted_parameters
 
  private
 
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :type)
  end
 
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :type)
  end

end

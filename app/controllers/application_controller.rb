class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone])
		end

	private

	def after_sign_in_path_for(resource)
  		case resource
  		when Admin
    		admins_path
		end
	end
  
	def authenticate_user!
		return unless user_signed_in? && current_user.is_deleted?
		sign_out
		redirect_to root_path
	end

	# def after_sign_out_path_for(resource)
 #  		case resource
 #  		when Admin
 #    		admins_sign_in_path
 # 		when User
 #    		users_sign_out_path
 #  		end
	# end

end


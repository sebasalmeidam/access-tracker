class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		dashboard_admin_users_path
	end

	def after_sign_out_path_for(resource)
		root_path
	end

end

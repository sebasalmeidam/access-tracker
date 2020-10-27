class AdminController < ApplicationController
	before_action :authenticate_user!
	before_action :validate_admin

	private

	def validate_admin
		unless current_user.admin
			flash[:notice] = 'No tienes permiso para entrar'
			sign_out current_user
			redirect_to new_user_session_path
		end
	end


end
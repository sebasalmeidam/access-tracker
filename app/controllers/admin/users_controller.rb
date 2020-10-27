class Admin::UsersController < AdminController

	def dashboard
		@personales = Personal.all		
	end

	def exportar_registros
		@registros = Registro.where.not(personal_id: nil)
		respond_to do |format|
			format.xlsx { headers["Content-Disposition"] = "attachment; filename=Registros.xlsx" }
		end
	end

end

class Admin::PersonalesController < AdminController

	def new
		@personal = Personal.new
	end

	def create
		@personal = Personal.new(personal_params)
		if @personal.save
			redirect_to admin_personales_path
		else
			render 'new'
		end
	end

	def index
		@personales = Personal.all
	end

	def destroy
		@personal = Personal.find(params[:id])
		@personal.destroy
		redirect_to admin_personales_path
	end

	private

	def personal_params
		params.require(:personal).permit(:nombres, :apellidos, :codigo)		
	end
end

class RegistrosController < ApplicationController

	def crear_desde_api
		if params[:codigo] && params[:codigo] != '' && params[:tipo] && params[:tipo] != ''
			@personal = Personal.find_by(codigo: params[:codigo.to_s])
			if @personal
				@registro = @personal.registros.where(created_at: Date.today.all_day).first_or_initialize
				case params[:tipo]
				when 'entrada'
					if @registro.entrada.nil?
						@registro.entrada = Time.now	
					else
						render json: {status: 204, mensaje: 'Ya está registrado'} and return
					end					
				when 'salida'
					if @registro.salida.nil?
						@registro.salida = Time.now	
					else
						render json: {status: 204, mensaje: 'Ya está registrado'} and return
					end					
				when 'salida_almuerzo'
					if @registro.empezo_almuerzo.nil?
						@registro.empezo_almuerzo = Time.now	
					else
						render json: {status: 204, mensaje: 'Ya está registrado'} and return
					end					
				when 'regreso_almuerzo'
					if @registro.termino_almuerzo.nil?
						@registro.termino_almuerzo = Time.now	
					else
						render json: {status: 204, mensaje: 'Ya está registrado'} and return
					end					
				end

				if @registro.new_record?
					@registro.fecha = Date.today
				end
				
				if @registro.save
					render json: {status: 200} and return
				else
					render json: {status: 400} and return
				end
			else
				render json: {status: 400} and return
			end
		end
	end

	def obtener_registros
		@personas = Personal.all
		@registros = PersonalSerializer.new(@personas).serialized_json
		render json: @registros
	end


end

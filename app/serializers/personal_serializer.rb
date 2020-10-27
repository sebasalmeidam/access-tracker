class PersonalSerializer
  include FastJsonapi::ObjectSerializer
  attribute :nombres do |object|
  	object.nombres.titleize
  end
  meta do |object|
  	if @registro = Registro.where("DATE(created_at) = ?", Date.today).where(personal_id: object.id).first
  		{
  			entrada: @registro.entrada.nil? ? 'No' : 'Si',
  			salida: @registro.salida.nil? ? 'No' : 'Si',
  			empezo_almuerzo: @registro.empezo_almuerzo.nil? ? 'No' : 'Si',
  			termino_almuerzo: @registro.termino_almuerzo.nil? ? 'No' : 'Si'
  		}
  	else
  		{
  			entrada: 'No',
  			salida: 'No',
  			empezo_almuerzo: 'No',
  			termino_almuerzo: 'No'
  		}
  	end
  end

end

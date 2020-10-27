import React from  'react';

const Registro = ({registro}) => {
	
	function checkPositive(value){
		if (value === 'Si') {
			return (
				<i className="oi oi-check text-success"></i>
			)
		} else {
			return (
				<i className="oi oi-x text-danger"></i>
			)
		}
	}


	return (
		<tr>
			<td>{registro.attributes.nombres}</td>
			<td className='text-center'>{checkPositive(registro.meta.entrada)}</td>
			<td className='text-center'>{checkPositive(registro.meta.empezo_almuerzo)}</td>
			<td className='text-center'>{checkPositive(registro.meta.termino_almuerzo)}</td>
			<td className='text-center'>{checkPositive(registro.meta.salida)}</td>
		</tr>
	)
}

export default Registro
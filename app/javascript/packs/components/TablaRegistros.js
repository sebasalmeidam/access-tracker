import React, {useEffect, useContext} from 'react'
import {EstadoContext, EstadoProvider} from './context/EstadoContext';
import Registro from './Registro'

const TablaRegistros = () => {
	
	const { state, dispatch } = useContext(EstadoContext);
	
  useEffect(()=> {
  	const url = "/obtener_registros"
  	fetch(url)
  	.then(response => response.json())
  	.then(data => {
  		// console.log(data.data);
  		dispatch({type: "procesarRegistros", payload: data.data })
  	})
  }, [state.procesado])

	return (
		<div className="col-md-5">
			<div className="row">
				<div className="col-md-12">
					<table className="table table-sm table-hover mt-4">
						<thead className="thead-light">
							<tr>
								<th>Nombre</th>
								<th className="text-center">Entrada</th>
								<th className="text-center">Almuerzo</th>
								<th className="text-center">Regreso</th>
								<th className="text-center">Salida</th>
							</tr>
						</thead>
						<tbody>
							{state.registros.map((registro, index) => (
								<Registro 
									key={registro.id}
									registro={registro}
								/>
							))}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	)
}

export default TablaRegistros;
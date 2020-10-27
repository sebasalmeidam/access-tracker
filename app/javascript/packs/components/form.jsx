import React, {useContext} from 'react'
import {EstadoContext, EstadoProvider} from './context/EstadoContext';

function Form({realizarCambio, accion}) {
	
	const { state, dispatch } = useContext(EstadoContext);

	const validarCodigo = (e) => {
		if (e.target.value.length > 4) {
			let code = e.target.value
			let tipo = accion
			const url = `/crear_desde_api?codigo=${code}&tipo=${tipo}`
			fetch(url)
			.then(response => response.json())
			.then(data => {
				if (data.status == 200 || data.status == 204) {
					dispatch({ type: "procesarCodigo" });
					realizarCambio(data.status);
				}
			})
		}
	}

	return (
		<form className='form-inline justify-content-center' onSubmit={(e)=> {this.preventDefault(e)}} >
			<div className="form-group">
				<input onChange={validarCodigo} type="password" className='form-control' placeholder='Código' autoFocus />
				<div className="input-group-prepend">
          <div className="input-group-text"><i>i</i></div>
        </div>
			</div>
		</form>
	)
}

export default Form;
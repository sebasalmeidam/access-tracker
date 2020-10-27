import React, {useEffect, useState} from 'react'

import Form from './form'

function Block(props) {
	
	const [mostrar, setMostrar] = useState(false);
	const [cargando, setCargando] = useState(false);
	const [registrado, setRegistrado] = useState(false);
	
	const showForm = (e) => {
		e.preventDefault();
		let cambiar = !mostrar
		setMostrar(cambiar)
	}

	const realizarCambio = (status) => {
		if (status === 200) {
			setCargando(true);
			setMostrar(false);
			setTimeout(function() {
				setCargando(false)
			}, 2000)
		}
		if (status === 204) {
			setRegistrado(true);
			setCargando(true);
			setMostrar(false);
			setTimeout(function() {
				setCargando(false);
				setRegistrado(false);
			}, 2000)
		}
	}

	const loading = () => {
		let mensaje = registrado ? 'Ya existe registro' : 'Registro Exitoso' 

		return (
			<div className="card-container text-center">
				<div className="card bg-info">
					<div className="card-body">
						<h5 className="card-title">
							{mensaje}
						</h5>
					</div>
				</div>
			</div>
		)
	}

	const link = ({btnColor, btnText}) => {
		let color = 'btn btn-3d btn-block btn-big'
		let propColor = btnColor
		let finalClass = `${color} ${propColor}`
		return (
			<button onClick={showForm} className={finalClass}>{btnText}</button>
		)	
	}

	const form = () => {
		return (
			<div className="card-container text-center">
				<div className="card bg-info">
					<div className="card-body">
						<h5 className="card-title">
							Ingresa tu código
						</h5>
						<Form
							realizarCambio={realizarCambio}
							accion = {props.accion}
						 />
						<a className='regresar' href='#' onClick={showForm}>Cancelar</a>
					</div>
				</div>
			</div>
		)
	}

	// useEffect( 
	// 	() => {
			

	// 	}, [mostrar]
	// )

	const display = () => {
		if (cargando) return (loading())
		
		if (mostrar) {
			return (
				form()
			)
		} else {
			return (
				link(props)

			)
		}
	}

	return (
		<div className="col-md-6 mt-4">
			{display()}
		</div>
	)
}

export default Block;
import React, {useEffect, useContext} from 'react'
import {EstadoContext, EstadoProvider} from './context/EstadoContext';
import TablaRegistros from './TablaRegistros'
import ReactDOM from 'react-dom'
import Block from './block'

const Hello = props => {
	
	return (
	  <React.Fragment> 
		  <EstadoProvider>
		  	<div className="row">
					
					<TablaRegistros />
					
					<div className="col-md-7">
						<div className="row">
							<Block 
								btnColor='btn-primary'
								btnText='Entrada' 
								accion = 'entrada'
							/>

							<Block 
								btnColor='btn-success'
								btnText='Salida' 
								accion = 'salida'
							/>

							<Block 
								btnColor='btn-secondary'
								btnText='Inicio Almuerzo' 
								accion = 'salida_almuerzo'
							/>
							
							<Block 
								btnColor='btn-danger'
								btnText='Finaliza Almuerzo' 
								accion = 'regreso_almuerzo'
							/>
						</div>
					</div>			
				</div>
			</EstadoProvider>
		</React.Fragment>
	)
}

document.addEventListener('DOMContentLoaded', () => {
  const buttonsContainer = document.getElementById('react-container')
  ReactDOM.render(
    <Hello name="React" />,
    buttonsContainer,
  )
})

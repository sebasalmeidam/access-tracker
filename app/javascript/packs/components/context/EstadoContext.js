import React, {useReducer} from 'react';

let reducer = (state, action) => {
  switch (action.type) {
  	case "procesarCodigo":
      return { ...state, procesado: !state.procesado };
    case "procesarRegistros":
      return { ...state, registros: action.payload }; 
    default:
    	return;
  }
};

const initialState = {
	procesado: false,
	registros: []
}

const EstadoContext = React.createContext(initialState);

function EstadoProvider(props) {
	const [state, dispatch] = useReducer(reducer, initialState);

	return (
		<EstadoContext.Provider value={{state, dispatch}}>
			{props.children}
		</EstadoContext.Provider>
	)
}

export { EstadoContext, EstadoProvider};
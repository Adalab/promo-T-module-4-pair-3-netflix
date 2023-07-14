// login

const getMoviesFromApi = async () => {
  console.log('Se están pidiendo las películas de la app');
  // CAMBIA ESTE FETCH PARA QUE APUNTE A UN ENDPOINT DE TU SERVIDOR, PIENSA SI DEBE SER GET O POST, PIENSA QUÉ DATOS DEBES ENVIAR, ETC
  
  const response = await fetch ('http://localhost:4000/movies');

    const dataMoviesJson = await response.json();
    return dataMoviesJson;
  
      // CAMBIA EL CONTENIDO DE ESTE THEN PARA GESTIONAR LA RESPUESTA DEL SERVIDOR Y RETORNAR AL COMPONENTE APP LO QUE NECESITA
};

const objToExport = {
  getMoviesFromApi: getMoviesFromApi
};

export default objToExport;

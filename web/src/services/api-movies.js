//hay que ponerle params a la funcion
const getMoviesFromApi = async (params) => {
  console.log('Se están pidiendo las películas de la app');
  console.log(params);
  //aquí solo cambiar la url para reflejar los params, solo se pone params
  const response = await fetch(`http://localhost:4000/movies?genre=${params.genre}&sort=${params.sort}`);
  const dataMoviesJson = await response.json();
  return dataMoviesJson;
};

const objToExport = {
  getMoviesFromApi: getMoviesFromApi,
};

export default objToExport;

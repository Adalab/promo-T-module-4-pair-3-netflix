const getMoviesFromApi = async (params) => {
  console.log('Se están pidiendo las películas de la app');
  console.log(params);
  const response = await fetch(`http://localhost:4000/movies?genre=${params.genre}`);
  const dataMoviesJson = await response.json();
    console.log(dataMoviesJson);
  return dataMoviesJson;
};

const objToExport = {
  getMoviesFromApi: getMoviesFromApi,
};

export default objToExport;

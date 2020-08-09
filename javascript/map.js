import * as mapboxgl from 'mapbox-gl';
mapboxgl.accessToken = `${process.env.MAPBOX_ACCESS_TOKEN}`;

export const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11'
});


import * as mapboxgl from 'mapbox-gl';

mapboxgl.accessToken = `${process.env.MAPBOX_ACCESS_TOKEN}`;

var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v11',
  center: [-122.271111, 37.804363],
  zoom: 8
});

var marker = new mapboxgl.Marker()
  .setLngLat([-122.271111, 37.804363])
  .addTo(map);
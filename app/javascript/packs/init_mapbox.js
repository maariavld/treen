import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  var vegan = document.getElementById('filter-vegan');
  var all = document.getElementById('filter-all');
  var good = document.getElementById('filter-good-cause');
  var fairTrade = document.getElementById('filter-fair-trade');
  var co2 = document.getElementById('filter-co-2');
  var secondHand = document.getElementById('filter-second-hand');
  var organic = document.getElementById('filter-organic');

  const removeActive = () => {
    const indicators = document.querySelectorAll('.mb-2');
    indicators.forEach((el) => {
    console.log(el);
    el.classList.remove('active');
    });
  };

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 25, duration: 0 });
  };

  if (mapElement) { // only build a map if there's a div#map to inject into
    // mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/erikvogler/ckpo4lvfc09qh17mdwnl6dgfu'
    });
    const markers = JSON.parse(mapElement.dataset.markers);

    markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
    });
    fitMapToMarkers(map, markers);

    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showAccuracyCircle: false
      }),
    );

    map.addControl(new mapboxgl.NavigationControl());

    // s
  }
};
export { initMapbox };


// const imgFilter =document.querySelector('img');
// const indicators =document.querySelectorAll('.indicators > li');
// const getCurrentImageIndex = () => {
//   const currentImage = getAttr(imgFilter, 'src');
//   return getImageIndex(currentImage);
//  };
// const activateIndicator = (index) => {
//   indicators.forEach((el, i) => {
//    if (el.classList.contains('active')) {
//     el.classList.remove('active')
//    };
//    if (index === i) el.classList.add('active');
//   })
//  };

//  const indicators =document.querySelectorAll('.indicators > li');
//  const activateIndicator = (index) => {
//   indicators.forEach((el) => {
//    el.classList.remove('active')) {
//     el.classList.remove('active')
//    };
//    if (index === i) el.classList.add('active');
//   }),
//  };



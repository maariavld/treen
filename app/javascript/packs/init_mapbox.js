import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  var vegan = document.getElementById('vegan-filter');
  var all = document.getElementById('all-filter');
  var good = document.getElementById('good-cause-filter');
  var fairTrade = document.getElementById('fair-trade-filter');
  var co2 = document.getElementById('co2-filter');
  var secondHand = document.getElementById('second-hand-filter');
  var organic = document.getElementById('organic-filter');
  const removeActive = () => {
    const indicators = document.querySelectorAll('.filter > img');
    console.log(indicators);
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
    new mapboxgl.Marker({
          color: "#BCA788",
          scale: 1.5,
        })
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


    vegan.onclick = function(e) {
        removeActive();
        this.className = 'active';
        // const currentBounds = map.getBounds();
        // console.log(currentBounds);
        document.querySelectorAll('.mapboxgl-marker').forEach(element => {
          element.remove()
        });
        // The setFilter function takes a GeoJSON feature object
        // and returns true to show it or false to hide it.
        markers.filter(function(f) {
          // console.log(f);
          return f.vegan;
        }).forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window);
        new mapboxgl.Marker({
          color: "#BCA788",
        })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
        });
        // fitMapToMarkers(map, markers);

        return false;
    };

        good.onclick = function(e) {
        removeActive();
        this.className = 'active';
        document.querySelectorAll('.mapboxgl-marker').forEach(element => {
          element.remove()
        });
        // The setFilter function takes a GeoJSON feature object
        // and returns true to show it or false to hide it.
        markers.filter(function(f) {
          // console.log(f);
          return f.good;
        }).forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window);
        new mapboxgl.Marker({
          color: "#BCA788",
        })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
        });
        // fitMapToMarkers(map, markers);

        return false;
    };
    fairTrade.onclick = function(e) {
        removeActive();
        this.className = 'active';
        document.querySelectorAll('.mapboxgl-marker').forEach(element => {
          element.remove()
        });
        // The setFilter function takes a GeoJSON feature object
        // and returns true to show it or false to hide it.
        markers.filter(function(f) {
          // console.log(f);
          return f.fairTrade;
        }).forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window);
        new mapboxgl.Marker({
          color: "#BCA788",
        })
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
        });
        // fitMapToMarkers(map, markers);

        return false;
    };
    co2.onclick = function(e) {
      removeActive();
      this.className = 'active';
      document.querySelectorAll('.mapboxgl-marker').forEach(element => {
        element.remove()
      });
        // The setFilter function takes a GeoJSON feature object
        // and returns true to show it or false to hide it.
        markers.filter(function(f) {
          // console.log(f);
          return f.co2;
        }).forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window);
        new mapboxgl.Marker({
          color: "#BCA788",
        })
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        });
        // fitMapToMarkers(map, markers);

        return false;
    };

    organic.onclick = function(e) {
      removeActive();
      this.className = 'active';
      document.querySelectorAll('.mapboxgl-marker').forEach(element => {
        element.remove()
      });
        // The setFilter function takes a GeoJSON feature object
        // and returns true to show it or false to hide it.
        markers.filter(function(f) {
          // console.log(f);
          return f.organic;
        }).forEach((marker) => {
          const popup = new mapboxgl.Popup().setHTML(marker.info_window);
          new mapboxgl.Marker({
          color: "#BCA788",
        })
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        });
        // fitMapToMarkers(map, markers);

        return false;
    };

    secondHand.onclick = function(e) {
      removeActive();
      this.className = 'active';
      document.querySelectorAll('.mapboxgl-marker').forEach(element => {
        element.remove()
      });
        // The setFilter function takes a GeoJSON feature object
        // and returns true to show it or false to hide it.
        markers.filter(function(f) {
          // console.log(f);
          return f.secondHand;
        }).forEach((marker) => {
          const popup = new mapboxgl.Popup().setHTML(marker.info_window);
          new mapboxgl.Marker({
          color: "#BCA788",
        })
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup)
          .addTo(map);
        });
        // fitMapToMarkers(map, markers);

        return false;
    };

    all.onclick = function(e) {
        removeActive();
        this.className = 'active';
        markers.forEach((marker) => {
            const popup = new mapboxgl.Popup().setHTML(marker.info_window);
            new mapboxgl.Marker({
          color: "#BCA788",
        })
              .setLngLat([ marker.lng, marker.lat ])
              .setPopup(popup)
              .addTo(map);
        });
        // fitMapToMarkers(map, markers);
        return false;
    };
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



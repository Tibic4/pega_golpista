import { Controller } from "@hotwired/stimulus";
import { map } from "jquery";

// Connects to data-controller="maps"
export default class extends Controller {
  static values = {
    markers: Array
  }
  // Map styles


  connect() {
    console.log("Maps controller connected");
    this.initializeMap();
    this.#addMarkersToMap()
  }



  initializeMap() {
    // Map styles
    var mapStyles = [
      {
        featureType: "poi.attraction",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.business",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.government",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.medical",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.park",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.place_of_worship",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.school",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
      {
        featureType: "poi.sports_complex",
        elementType: "labels",
        stylers: [
          {
            visibility: "off",
          },
        ],
      },
    ];

    var mapOptions = {
      // Set Center
      zoom: 8,
      styles: mapStyles,
      // mapTypeId: google.maps.MapTypeId.ROADMAP,
      zoomControl: true,
      gestureHandling: "cooperative",
      // remove the default map controls
      streetViewControl: false,
      mapTypeControl: false,
      fullscreenControl: false,
      scaleControl: false,
      rotateControl: false,
      streetViewControl: false,
      panControl: false,

    };
    var map = new google.maps.Map(this.element, mapOptions);


    // Get the location of the user
    if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition((position) => {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            // Center at the user's location
            map.setCenter(new google.maps.LatLng(latitude, longitude));

          }, () => {
            map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
          }
            );

    } else {
        console.log("Geolocation is not allowed");
            // Centered at the default location
         map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
      }
    }

  // Add market to the map
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new google.maps.Marker({
        position: { lat: marker.lat, lng: marker.lng },
        map: this.map,
      });
      console.log(marker);
    });
  }
}

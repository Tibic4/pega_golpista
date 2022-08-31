import { Controller } from "@hotwired/stimulus";
import { map } from "jquery";

// Connects to data-controller="maps"
export default class extends Controller {
  // Map styles


  connect() {
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
      streetViewControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      // remove the default map controls
      mapTypeControl: false,
      fullscreenControl: false,
      zoomControl: false,
      scaleControl: false,
      rotateControl: false,
      streetViewControl: false,
      panControl: false,

    };
    var map = new google.maps.Map(this.element, mapOptions);


    // Get the location of the user
    if (navigator.geolocation) {
      navigator.permissions.query({ name: "geolocation" }).then((result) => {
        if (result.state === "granted") {
          navigator.geolocation.getCurrentPosition((position) => {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            // Center at the user's location
            map.setCenter(new google.maps.LatLng(latitude, longitude));

          });

        } else {
            // Centered at the default location
            map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
        }
      });
    }
  }
}

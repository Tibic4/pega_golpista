import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="maps"
export default class extends Controller {
  static values = {
    markers: Array,
    //count of scammers value
    countOfScammers: Array,
  };
  // Map styles

  connect() {
    console.log("Maps controller connected");
    this.initializeMap();
    // Parse count_of_scammers
    // this.countOfScammersValue = JSON.parse(this.countOfScammersValue);

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
    // if (navigator.geolocation) {
    //   navigator.geolocation.getCurrentPosition(
    //     (position) => {
    //       const latitude = position.coords.latitude;
    //       const longitude = position.coords.longitude;

    //       // Center at the user's location
    //       map.setCenter(new google.maps.LatLng(latitude, longitude));
    //     },
    //     () => {
    //       map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
    //     }
    //   );
    // } else {
    //   console.log("Geolocation is not allowed");
    //   // Centered at the default location
    //   map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
    // }
    // Add market to the map
    this.markersValue.forEach((marker) => {
      console.log(marker);
    });

    this.countOfScammersValue.forEach((scammer) => {
      console.log(scammer);
    });
    // Compare marker ddd with the count of scammers
    // this.count_of_scammersValue.forEach((scammer) => {
    //   console.log(scammer);
    //   this.markersValue.forEach((marker) => {
    //     if (scammer.ddd == marker.ddd) {
    //       console.log(scammer.ddd);
    //       console.log(marker.ddd);
    //       const pin = new google.maps.Marker({
    //         position: {
    //           lat: parseFloat(marker.lat),
    //           lng: parseFloat(marker.lng),
    //         },
    //         map: map,
    //         // Label the marker with the number of scammers in the ddd
    //         label: {text: scammer.value , color: "white"},
    //         icon: "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m3.png",
    //       });
    //       pin.setMap(map);
    //     }
    //   });
    // });
  }
}

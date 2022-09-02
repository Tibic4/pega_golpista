import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="maps"
export default class extends Controller {
  static values = {
    markers: Array,

    //count of scammers value
    countOfScammers: Array,
  };


  connect() {
    console.log("Maps controller connected");
    this.initializeMap();
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
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const latitude = position.coords.latitude;
          const longitude = position.coords.longitude;

          // Center at the user's location
          map.setCenter(new google.maps.LatLng(latitude, longitude));
        },
        () => {
          map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
        }
      );
    } else {
      console.log("Geolocation is not allowed");
      // Centered at the default location
      map.setCenter(new google.maps.LatLng(-23.5489, -46.6388));
    }

    const countScammers = this.countOfScammersValue;
    const myMarkers = this.markersValue;


    // Funciton to take value of the count of scammers
    const countScammersFunc = (key) => {
      for (var key in countScammers) {
        if (countScammers.hasOwnProperty(key)) {
          var val = countScammers[key];
          return val;
        }
        console.log(val);
      }
    };

    // Funcition transforms the scammer value hash in integer
    const hash = (str) => {
      let hash = 0;
      for (let i = 0; i < str.length; i++) {
        hash = str.charCodeAt(i) + ((hash << 5) - hash);
        hash = hash & hash;
      }
      return hash;
    };

    // Call Funcition to test
    // console.log(countScammersFunc("countScammers"));


    countScammers.forEach((count) => {
      console.log(countScammersFunc(count.ddd));
      // console.log(count.ddd);
      // console.log(Object.values(count));
    });

    // Mark map if count of scammers ddd equal markers ddd

    myMarkers.forEach((marker) => {
      countScammers.forEach((scammer) => {
        if (scammer.ddd == marker.ddd) {
          const markerPosition = new google.maps.LatLng(marker.lat, marker.lng);
          const markerOptions = {
            position: markerPosition,
            map: map,
            title: marker.title,
          };
          // Call function
          const myValue = countScammersFunc(scammer.ddd);

          const googleMarker = new google.maps.Marker({
            ...markerOptions,
            icon: {
              url: "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m3.png",
              scaledSize: new google.maps.Size(50, 50),
            },
            label: {
              text: `${scammer.ddd}`,
              color: "white",
              fontSize: "16px",
              fontWeight: "bold",
            },
          });
          const infoWindow = new google.maps.InfoWindow({
            content: marker.infoWindow,
          });
          googleMarker.addListener("click", () => {
            infoWindow.open(map, googleMarker); // Open the info window
          });
        }
      });
    });
  }
}

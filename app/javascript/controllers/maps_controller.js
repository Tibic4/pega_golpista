import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="maps"
export default class extends Controller {
  connect() {}

  initializeMap() {
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
    // Get the location of the user
    if (navigator.geolocation) {
      navigator.permissions.query({ name: "geolocation" }).then((result) => {
        if (result.state === "granted") {
          navigator.geolocation.getCurrentPosition((position) => {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;

            // Create a map centered at the user's location
            const map = new google.maps.Map(this.element, {
              center: { lat: latitude, lng: longitude },
              zoom: 8,
            });

            // // Style the map
            // map.setOptions({ styles: mapStyles });
          });
        } else {
          const map = new google.maps.Map(this.element, {
            center: { lat: -23.5489, lng: -46.6388 },
            zoom: 8,
          });
        }
      });
    }
  }
}

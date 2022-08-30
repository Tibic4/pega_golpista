import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="maps"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  initializeMap() {
    // Get the location of the user
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => {
        const latitude = position.coords.latitude
        const longitude = position.coords.longitude

        // Create a map centered at the user's location
        const map = new google.maps.Map(this.element, {
          center: { lat: latitude, lng: longitude },
          zoom: 15,
        })

        // Add a marker at the user's location
        new google.maps.Marker({
          position: { lat: latitude, lng: longitude },
          map,
          title: "You are here!",
        })
      })
    }
  }
}

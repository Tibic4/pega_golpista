import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  console.log('Navbar está no Controller')
  }
  updateNavbar() {
    if (window.scrollY) {
      this.element.classList.add("navbar-fixed")
    } else {
      this.element.classList.remove("navbar-fixed")
    }
  }
}

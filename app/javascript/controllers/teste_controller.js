import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="teste"
export default class extends Controller {
  connect() {
    console.log("teste")
  }
}

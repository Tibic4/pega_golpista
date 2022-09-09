import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap"

export default class extends Controller {
  connect() {
    this.modal = new Modal(this.element)
    this.close()
    this.modal.show()
  }

  hideBeforeRender(event) {
    if (this.isOpen()) {
      event.preventDefault()
      this.element.addEventListener('hidden.bs.modal', event.detail.resume)
      this.modal.hide()
      this.element.classList.remove("show")
    }
  }

  isOpen() {
    return this.element.classList.contains("show")
  }

  //Function to close modal in reload page

  close() {
    this.element.addEventListener("hidden.bs.modal", () => {
      this.element.remove()
    })
  }
}

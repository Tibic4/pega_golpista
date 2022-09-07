import { Controller } from "@hotwired/stimulus";


// Connects to data-controller="tasks"
export default class extends Controller {
  initialize() {
    this.submit = debounce(this.submit.bind(this), 300);
  }

  submit(_event) {
    this.element.requestSubmit();
  }
}

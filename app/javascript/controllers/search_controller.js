import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {}

  submit(_event) {
    if (window.innerWidth < 768) {
      this.element.requestSubmit();
    } else {
    }
    return;
  }
}

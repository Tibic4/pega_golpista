import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="tasks"
export default class extends Controller {
  static targets = ["table"];
  connect() {
    console.log("Hello, Stimulus!", this.element);
  }

  update(event) {
    event.preventDefault();
    const form = event.target;
    const formData = new FormData(form);
    const url = form.action;
    fetch(url, {
      method: "PATCH",
      body: formData,
      headers: {
        Accept: "application/json",
      },
      credentials: "same-origin",
    })
      .then((response) => response.json())
      .then((data) => {
        this.tableTarget.innerHTML = data.html;
      });

  }
}

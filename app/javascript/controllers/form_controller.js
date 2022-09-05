import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form"
export default class extends Controller{
    connect() {
    console.log("Form controller connected");
    this.myFunction();
    }

    myFunction() {
       const list = this.element.querySelector("#form-toggle");
        if (list.style.display === "none") {
          list.style.display = "block";
        } else {
          list.style.display = "none";
        }
      }
}
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="conditional-input"
export default class extends Controller {
  static targets = [ "date" ]
  connect() {
  }
  toggle(event) {
    if (event.target.value === "Payé") {
      this.dateTarget.classList.remove("d-none")
    }
    else {
      this.dateTarget.classList.add("d-none")
    }
  }
}

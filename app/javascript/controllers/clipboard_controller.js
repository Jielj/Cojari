import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  connect() {
    console.log("clipboard js connected")
  }
  static targets = ["input"];
  static values = {
    feedbackText: String
  }

  copy(event) {
    this.inputTarget.select();
    document.execCommand('copy');
    event.currentTarget.disabled = true;
    event.currentTarget.innerText = this.feedbackTextValue;
  }
}

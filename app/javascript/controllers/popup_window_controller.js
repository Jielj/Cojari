import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup-window"
export default class extends Controller {
  static targets = ["popup"]
  static values = {
    prop: String
  }
  connect() {
    console.log("popup window js connected")
  }
  showPopup() {
    console.log("clicked")
    console.log(this.propValue)
    this.popupTarget.classList.remove("d-none")
    console.log(this.popupTarget)
  }
}

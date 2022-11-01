import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coproperty-card"
export default class extends Controller {
  static targets = ["dropDown"]
  connect() {
    console.log("coproperty card controller connected")
  }

  toggleMenu() {
    this.dropDownTarget.classList.toggle("d-none")
  }
  hideMenu() {
    this.dropDownTarget.classList.add("d-none")
  }
  showMenu() {
    this.dropDownTarget.classList.remove("d-none")
  }
}

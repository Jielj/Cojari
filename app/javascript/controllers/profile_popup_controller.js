import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile-popup"
export default class extends Controller {
  static targets = ["profileContainer"]
  connect() {
    console.log("profile popup connected")
  }

  toggleProfile() {
    this.profileContainerTarget.classList.toggle("d-none")
  }
}

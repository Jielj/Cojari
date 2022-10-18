import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["container"]
  connect() {
    console.log("navbar js connected")
    console.log(this.containerTarget)

  }

  fixed() {
    console.log('added fixed position class')
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
      this.containerTarget.classList.add("fixed-position");
    } else {
      this.containerTarget.classList.remove("fixed-position");
    }
  }
}

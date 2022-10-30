import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-menus"
export default class extends Controller {
  static targets = ["editMenu"]
  connect() {
    console.log("dropdown menu connected")
  }
  toggleMenuTwo() {
    this.editMenuTarget.classList.toggle("d-none")
  }
  // hideMenu() {
  //   this.editMenuTarget.classList.add("d-none")
  // }
  // showMenu() {
  //   this.editMenuTarget.classList.remove("d-none")
  // }
}

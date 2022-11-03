import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = {
    variable: String
  }
  connect() {
    console.log("dashboard js connected")
  }

  showVar() {

  }
}

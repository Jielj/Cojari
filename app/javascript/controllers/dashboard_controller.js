import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static values = {
    variable: String
  }
  static targets = ["request"]
  connect() {
    console.log("dashboard js connected")
  }

  showVar() {
    console.log(this.variableValue)

  }
}

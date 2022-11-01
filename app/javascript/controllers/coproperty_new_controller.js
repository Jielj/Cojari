import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coproperty-new"
export default class extends Controller {
  connect() {
    console.log("connected")
  }
}

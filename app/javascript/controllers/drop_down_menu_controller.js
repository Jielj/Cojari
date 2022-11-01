import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="drop-down-menu"
export default class extends Controller {
  connect() {
    console.log('test success')
  }
}

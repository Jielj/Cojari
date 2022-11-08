import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="popup-window"
export default class extends Controller {
  static targets = ["popup" ,"close"]
  static values = {
    prop: String
  }
  connect() {
    console.log("popup window js connected")
    // this.closeTarget.addEventListner("click", ()=> {
    //   this.popupTarget.classList.toggle("d-none")
    // })
  }
  showPopup(e) {
    e.stopPropagation()
    this.popupTarget.classList.remove("d-none")
  }

  hidePopup(e) {
    e.stopPropagation()
    console.log("closing")
    this.popupTarget.classList.add("d-none")
  }
}

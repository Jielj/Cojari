import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="coproperty-info"
export default class extends Controller {
  static values = {copId: String}
  static targets = ["list", "cop_info_section"]
  connect() {
    console.log("property info js connected")
    console.log("the value : ", this.copIdValue)
  }

  highlight() {
    this.property_cardTarget.classList.add("highlight");
  }

  selected() {
    // console.log("the value : ", )

    // fetch(`/getProperties?copId=${this.copIdValue}`, {headers: {"Accept": "text/plain"}})
    // .then(response => response.text())
    // .then((data) => {
    //   this.listTarget.outerHTML = data
    // })
    console.log("item clicked")
    console.info("cop info target: ",this.cop_info_sectionTarget)


    if (this.codeIdValue == this.cop_info_sectionTarget) {
      this.cop_info_sectionTarget.classList.remove("d-none")
    } else {
      this.cop_info_sectionTarget.classList.add("d-none")
    }

  }
}

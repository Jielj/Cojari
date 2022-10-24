import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="coproperty-info"
export default class extends Controller {
  static values = { copId: String };
  static targets = ["list", "copInfoSection"];
  connect() {
    console.log("property info js connected");
  }

  highlight() {
    this.property_cardTarget.classList.add("highlight");
  }

  selected(event) {
    // console.log("the value : ", )

    // fetch(`/getProperties?copId=${this.copIdValue}`, {headers: {"Accept": "text/plain"}})
    // .then(response => response.text())
    // .then((data) => {
    //   this.listTarget.outerHTML = data
    // })
    console.log("item clicked", event.target);

    // console.info("cop info target: ", this.copInfoSectionTarget.getAttributes);
    console.log("cop id value: ", this.copIdValue);
    const properties = document.querySelectorAll(".propertiesList");

    properties.forEach(p => {
      p.classList.add("d-none");
      console.log(this.copIdValue)
      if (+this.copIdValue === +p.dataset.copId) {
        p.classList.remove("d-none");
      }
    });

  }
}

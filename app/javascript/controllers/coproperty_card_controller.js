import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="coproperty-card"
export default class extends Controller {
  static targets = ["dropDown", "dots"];
  connect() {
    console.log("coproperty card controller connected");
  }

  toggleMenu() {
    this.dropDownTarget.classList.toggle("d-none");
  }
  // hideMenu() {
  //   this.dropDownTarget.classList.add("d-none");
  // }
  // showMenu() {
  //   this.dropDownTarget.classList.remove("d-none");
  // }
  showThreeDots() {
    console.log("mouseover");
    this.dotsTarget.classList.remove("d-none");
  }
  hideThreeDots() {
    console.log("mouseout");
    this.dotsTarget.classList.add("d-none");
    // this.dropDownTarget.classList.add("d-none");
  }
}

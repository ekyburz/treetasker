import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="update-canvas-scene"
export default class extends Controller {
  static targets = ["form", "select", "canvas"];
  // connect() {
  //   console.log(this.formTarget);
  //   console.log(this.selectTarget);
  //   console.log(this.canvasTarget);
  // }
}

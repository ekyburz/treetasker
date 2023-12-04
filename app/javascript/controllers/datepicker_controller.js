import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      altInput: true,
      altFormat: "l, F j, Y at H:i",
      time_24hr: true,
      minDate: "today",
      enableTime: true,
      weekNumbers: true })
  }
}

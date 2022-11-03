import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application
window.$ = window.jQuery = jQuery;

export { application }
//

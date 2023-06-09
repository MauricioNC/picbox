// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("select2-bootstrap-theme/dist/select2-bootstrap")

import "bootstrap"
import "@fortawesome/fontawesome-free/css/all"
import "../stylesheets/application"
import "../select2/select2.min"
import "../customs/navbar"
import "../customs/images_likes"
import "../customs/create_boxes"
import "../customs/download_image"

var jQuery = require('jquery')

// include jQuery in global and window scope (so you can access it globally)
// in your web browser, when you type $('.div'), it is actually refering to global.$('.div')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

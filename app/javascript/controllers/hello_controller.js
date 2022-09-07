import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  connect() {
      console.log("Hello World!")
      $(window).on('scroll', function () {
        if ( $(window).scrollTop() > 10 ) {
            $('.navbar').addClass('active');
            $('.navbar-logo').addClass('active');
        } else {
            $('.navbar').removeClass('active');
            $('.navbar-logo').removeClass('active');
        }
      });
    }
  }

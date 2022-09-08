import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
  connect() {
      $(window).on('scroll', function () {
        if ( $(window).scrollTop() > 10 ) {
            $('.navbar').addClass('active');
        } else {
            $('.navbar').removeClass('active');
        }
      });
    }
  }

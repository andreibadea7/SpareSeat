import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

export default class extends Controller {
    function(){
      $('#keywords').tablesorter();
    }
  }

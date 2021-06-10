// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('packs/social-share-button.js.erb')
// import {initCarousel} from "../plugins/carousel"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from "./init_mapbox";
import 'social-share-button';
import { loadReview } from "./review";

import { Popup } from "mapbox-gl";
import { initPop } from "./popup";
import { initFilter} from "./filter";
import { sliderInit } from "./slider";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  // initCarousel();
  initMapbox();
  initPop();
  loadReview();
<<<<<<< HEAD
  initStarRating();
=======
  sliderInit();
  initFilter();
>>>>>>> master
});

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery3


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import $ from 'jquery';


Rails.start()
Turbolinks.start()
ActiveStorage.start()
$(document).ready(function() {
    // Function to retrieve and display product details
    function getProductDetails() {
      $.ajax({
        url: 'https://giftcards-sandbox.reloadly.com/countries/ae/products',
        type: 'GET',
        headers: {
          // Include any necessary authentication headers or tokens
        },
        success: function(response) {
          // Handle the API response
          var productDetails = response.productDetails;
  
          // Update the HTML content with the product details
          $('#product-details').html(productDetails);
        },
        error: function(error) {
          // Handle any errors
          console.log('Error:', error);
        }
      });
    }
  
    // Call the function to retrieve and display product details
    getProductDetails();
  });
  
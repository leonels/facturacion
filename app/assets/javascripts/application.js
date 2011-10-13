// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function getTotal(quantities) {
    var total = 0;
    $.each(quantities, function() {
        total += parseFloat($(this).closest('.item').find('.price').attr('data-price')) * parseInt($(this).val());
    });
    $("#total-price").html("$" + total + " USD");
}

// function fillLineItems(product){
// }

$(document).ready(function() {

  $(".product").change(function(event){
    var optionElem = $(this).find(":selected")[0]; // <option value="3" data-defaultQuantity="1">product name</option>
    $(this).closest('.item').find('.qty').val(optionElem.dataset.defaultquantity); // replace quantity
    $(this).closest('.item').find('.cost').val(optionElem.dataset.cost); // replace cost
    
    // alert($(this).attr('name')); // gets ID of select menu    
    // $('#testing').html(optionElem.dataset.defaultquantity);
    
    // $('.quantity').val(optionElem.dataset.defaultquantity); // changes all of the quantities because they're all .quantity
    
    // var optionElem = $(this).find(":selected")[0];
    // $('.quantity').val(optionElem.dataset.defaultQuantity);
    // $(get the price input text box).val(optionElem.dataset.defaultPrice);
  });

//    var product = $('.product');
//   product.blur(function() {
//      fillLineItems(product);
//    });
    
    var quantity = $('.quantity');
    getTotal(quantity); // So the total is calculated on page load.
    quantity.blur(function() {
      /* Check if quantity is empty */
      var qty = $(this).val;
      if(!qty) qty = '0';   
      getTotal(quantity);
    });

});

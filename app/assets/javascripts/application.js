// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function getTotal(lines) {
  var total = 0;
  $.each(lines, function(){
    total += parseFloat($(this).html());
  });
  $('#total-price').html('$' + total + ' USD');
}

function getLineItemTotals(lines){
  $.each(lines, function(){
    row_total = 0;
    var cost = parseFloat($(this).find('.cost').val()); // get cost
    var qty = parseFloat($(this).find('.qty').val()); // get quantity
    /* Check if quantity or cost are empty */
    if(!qty) qty = '0';
    if(!cost) cost = '0';
    row_total = cost * qty; // row_total = parseFloat($(this).find('.cost').val()) * parseFloat($(this).find('.qty').val());
    // $($(this).find('.lineitemtotal')).html(roundNumber(row_total,2));
    $($(this).find('.lineitemtotal')).html(row_total.toFixed(2));
  })
}

function roundNumber(num,dec){
  var result = Math.round(num*Math.pow(10,dec))/Math.pow(10,dec);
  return result;
}

$(document).ready(function() {

  // setup defaults: quantity=1 and price
  $(".product").change(function(event){
    var optionElem = $(this).find(":selected")[0]; // <option value="3" data-defaultQuantity="1">product name</option>
    $(this).closest('.item').find('.qty').val(optionElem.dataset.defaultquantity); // replace quantity
    $(this).closest('.item').find('.cost').val(optionElem.dataset.cost); // replace cost
    
    // alert($(this).attr('name')); // gets ID of select menu
  });

  var line = $('.item');
  // so the line totals are calculated on page load
  getLineItemTotals(line);

  // line item change
  var lineitem = $('.product');
  lineitem.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
    var line_totals = $('.lineitemtotal');
    getTotal(line_totals);
    $('#total-price').effect('highlight',{},3000);
  });

  // quantity change
  var qty = $('.qty');
  qty.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
    var line_totals = $('.lineitemtotal');
    getTotal(line_totals);
    $('#total-price').effect('highlight',{},3000);
  });
  
  // price change
  var cost = $('.cost');
  cost.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
    var line_totals = $('.lineitemtotal');
    getTotal(line_totals);
    $('#total-price').effect('highlight',{},3000);
  });

  var line_totals = $('.lineitemtotal');
  getTotal(line_totals); // So the total is calculated on page load.

});

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
    total += parseFloat($(this).closest('.item').find('.cost').attr('data-price')) * parseInt($(this).val());
  });
  $("#total-price").html("$" + total + " USD");
}

function getLineItemTotals(lines){
  // var total = 0;
  // $.each(lines, function(){
  //   total += parseFloat($(this).find('.cost').val());
  // });
  // total = parseFloat($(this).find('.cost').val()) * parseFloat($(this).find('.qty').val());
  // $('.lineitemtotal').html(parseFloat($(this).find('.cost').val()));
  // $('invoice_items tr').each(function(){
  $.each(lines, function(){
    row_total = 0;
    var cost = parseFloat($(this).find('.cost').val()); // get cost
    var qty = parseFloat($(this).find('.qty').val()); // get quantity
    
    /* Check if quantity or cost are empty */
    if(!qty) qty = '0';
    if(!cost) cost = '0';
    
    row_total = cost * qty;
    // row_total = parseFloat($(this).find('.cost').val()) * parseFloat($(this).find('.qty').val());
    
    $($(this).find('.lineitemtotal')).html(row_total);
    // $('td:not(.total) input:text', this).each(function(){
    //   row_total += Number($(this).val());
    // });
    // $('.total :input:Text', this).val(row_total);
    // $("#testing").html(cost);
  })
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
  });

  // quantity change
  var qty = $('.qty');
  qty.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
  });
  
  // price change
  var cost = $('.cost');
  cost.blur(function(){
    var line = $('.item');
    getLineItemTotals(line);
  });

  var lineitemtotals = $('.lineitemtotal');
  getTotal(lineitemtotals); // So the total is calculated on page load.
//  quantity.blur(function() {
    /* Check if quantity is empty */
//    var qty = $(this).val;
    // if(!qty) qty = '0';   
//    getTotal(quantity);
//  });

});

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){

  var $left = $("#sentence-list-left");
  var $right = $("#sentence-list-right");

  $("ul").click("li.shadow", function(event){
    event.preventDefault();
    var $li = $(event.target).closest("li");
    $li.find('form').submit();
  });

  $("body").on("ajax:success", "form#new-sentence", function(event, data) {
    event.preventDefault();
    $left.append(data);
    $("form#new-sentence")[0].reset();
  });

  $left.on("ajax:success", "form", function(event, data){
    var $li = $(event.target).closest("li");
    $li.hide();
    $right.append(data);
  });

  $right.on("ajax:success", "form", function(event, data){
    var $li = $(event.target).closest("li");
    $li.hide();
    $left.append(data);
  });

});

// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= #require jquery
//= #require jquery_ujs
 //= require gmaps4rails/bing.js

 //= require gmaps4rails/googlemaps.js

 //= require gmaps4rails/mapquest.js

 //= require gmaps4rails/openlayers.js

//= require gmaps4rails/all_apis.js
//= require_tree .


$(document).ready(function(){

 //section selection categories
 $("#ad_section_id").live('change', function(event){
        event.preventDefault();
        if($(this).val() == ""){
            $("#cat_section").hide();
          }
        else{
      $.ajax({
        dataType: "html",
        url: "/ads/"+$(this).val()+"/selection_cat" ,
        success: function(res){
            $('#categories_list').html(res)
          }
       });

          $("#cat_section").show();
          }
  });
//category selection sub-categories
  $("#ad_category_id").live('change', function(event){
        event.preventDefault();
        if($(this).val() == ""){
            $("#sub_categories").hide();
          }
        else{
      $.ajax({
        dataType: "html",
        url: "/ads/"+$(this).val()+"/sub_categories" ,
        success: function(res){
            $('#sub_categories_list').html(res)
          }
       });
          $("#sub_categories").show();
          }
  });



});
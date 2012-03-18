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


function toggleChecked(status) {
   $("#checkboxes input").each( function() {
   $(this).attr("checked",status);
  })
}

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

  
  $(".watch").live('click', function(event){
        event.preventDefault();

      $.ajax({
        dataType: "script",
        url: "/users/create_watching/"+$(this).attr("id") ,
        success: function(res){
            $('.watch').html("Watching");
          }
       });
        
  });


 

initGallery();


});


function selectBox(obj,name){    
   $("#select"+name).html(obj.options[obj.selectedIndex].text);     
}
function selected(selectOption)
{
$.ajax({
  url: '/groups/select_category',
  dataType: "script",
  cache: false,
  data: "category="+selectOption,
  success: function(message){
  }
});

}  

function initGallery() {
	jQuery('.gallery-block').each(function() {
		var list = jQuery('.gallery > ul', this),
			next = jQuery('.link-next', this),
			prev = jQuery('.link-prev', this);

		list.carouFredSel({
                        responsive: true,
			width: 749,
			height: 'auto',
			prev: prev,
			next: next,
                        items: {
						width: 50,
					//	height: '30%',	//	optionally resize item-height
						visible: {
							min: 2,
							max: 4
						}
					},
			scroll: { duration: 800 },
			auto: {
				delay: 3000,
				pauseOnHover: true
			}
		})
	});


}

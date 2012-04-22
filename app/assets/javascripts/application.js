// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//


 //= require gmaps4rails/bing.js

 //= require gmaps4rails/googlemaps.js

 //= require gmaps4rails/mapquest.js

 //= require gmaps4rails/openlayers.js

//= require gmaps4rails/all_apis.js



function toggleChecked(status) {
   $("#checkboxes input").each( function() {
   $(this).attr("checked",status);
  })
}

$(document).ready(function(){
   
   
   

   
setTimeout(hideFlashMessages, 3500);
$('#myCarousel').carousel({
        interval: 3500
    });
    $('#adPhotos').carousel({
        interval: 3500
    });
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
            $('.watch').removeClass("watch")
          }
       });
        
  });


 

initGallery();

$('#reply').on('show',function(){      
    var obj =  $(this)
        $.ajax({
            type: 'GET',
            url: $(this).attr('url'),
            success: function(data) {
                obj.html(data)
              replyFormHandler(); // handler
            }
        });
})
var replyFormHandler =  function(){
$("#reply-submit").click(function(e){
        $('#reply').find('.inline-errors').remove();
        var errors = false;
        var url = $('#new_reply').attr('action');
        var name = $('#reply').find('#reply_name');
        var email = $('#reply').find('#reply_email');
        var phone = $('#reply').find('#reply_phone');
        var comments = $('#reply').find('#reply_message');
        if (name.val() === '' || name.val() === undefined) {
            errors = true;
            name.after("<p class='inline-errors'>can't be blank</p>");
        }
        if (phone.val() !== '' && !isValidMobile(phone.val())) {           
	            errors = true;
	            phone.after("<p class='inline-errors'>can't be invalid</p>");
	  }
        if (email.val() === '' || email.val() === undefined || !isValidEmail(email.val())) {
            errors = true;
            email.after("<p class='inline-errors'>can't be blank or invalid</p>");
        }
        if (comments.val() === '' || comments.val() === undefined) {
            errors = true;
            comments.after("<p class='inline-errors'>can't be blank</p>");
        }
        if (!errors) {
            $("#reply-submit").hide();
            $('#reply').find('.loader').show();
            $.ajax({
                type: 'POST',
                url: url,
                data: $("#new_reply").serialize(),
                success: function(data) {
                    $('#reply').modal('hide');
                    if (data === 'success') {
                        $('.notice-area').html("<div class='alert alert-success'>Thanks for your reply!</div>")
                    }
                    else {
                        $('.notice-area').html("<div class='alert alert-error'>There was a problem. Please retry later.</div>")
                    }
                    setTimeout(hideFlashMessages, 3500);
                }
            });
        }
    });	
}







// *** Contact form *** //    
    $('#contact').on('show', function () {
        resetContactForm(true);
    })
    
$("#contact-submit").click(function(e){
        $('#contact').find('.inline-errors').remove();
        var errors = false;
        var url = $('#contact').attr('url');
        var name = $('#contact').find('#name');
        var email = $('#contact').find('#email');
        var about = $('#contact').find('#about').val();
        var comments = $('#contact').find('#comments');
        if (name.val() === '' || name.val() === undefined) {
            errors = true;
            name.after("<p class='inline-errors'>can't be blank</p>");
        }
        if (email.val() === '' || email.val() === undefined || !isValidEmail(email.val())) {
            errors = true;
            email.after("<p class='inline-errors'>can't be blank or invalid</p>");
        }
        if (comments.val() === '' || comments.val() === undefined) {
            errors = true;
            comments.after("<p class='inline-errors'>can't be blank</p>");
        }
        if (!errors) {
            $("#contact-submit").hide();
            $('#contact').find('.loader').show();
            $.ajax({
                type: 'POST',
                url: url,
                data: {
                    name: name.val(),
                    email: email.val(),
                    about: about,
                    comments: comments.val()
                },
                success: function(data) {
                    $('#contact').modal('hide');
                    if (data === 'success') {
                        $('.notice-area').html("<div class='alert alert-success'>Thanks for your input!</div>")
                    }
                    else {
                        $('.notice-area').html("<div class='alert alert-error'>There was a problem. Please retry later.</div>")
                    }
                    setTimeout(hideFlashMessages, 3500);
                }
            });
        }
    });	


});

var isValidEmail = function(email) {
    var email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return email_regex.test(email);
}

function isValidMobile(phone){
    var phone_regex = /^[1-9]\d{9}$/;
    return phone_regex.test(phone.trim());
}

function hideFlashMessages() {
    $('.alert').fadeOut(600);
}

var resetContactForm = function(toggle) {
    $('#contact').find('.inline-errors').remove();
    if (toggle) {
        $("#contact-submit").show();
        $('#contact').find('.loader').hide();
    }
    else {
        $("#contact-submit").hide();
        $('#contact').find('.loader').show();
    }
    $("#contact-submit").show();
    $('#contact').find('.loader').hide();
    if ($('#user_login_status').val() == 'false'){
        $('#contact').find('#name').val('');
        $('#contact').find('#email').val('');
    }
    $('#contact').find('#comments').val('');
}

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

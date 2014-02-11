// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//


 //= require gmaps4rails/gmaps4rails.base.js.coffee

 //= require gmaps4rails/gmaps4rails.bing.js.coffee

 //= require gmaps4rails/gmaps4rails.googlemaps.js.coffee

 //= require gmaps4rails/gmaps4rails.mapquest.js.coffee

//= require gmaps4rails/gmaps4rails.openlayers.js.coffee



function toggleChecked(status) {
   $("#checkboxes input").each( function() {
   $(this).attr("checked",status);
  })
}

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}


var reportFormHandler = function(){

    $("#report-fraud").click(function(e){
        $('#report').find('.inline-errors').remove();
        var errors = true;
         var comments = $("#report_fraud_desc")
        if (comments.val() === '' || comments.val() === undefined) {
            errors = false;
            comments.after("<p class='inline-errors'>can't be blank</p>");
        }       
        return errors;
    })

    $("#report-spam").click(function(e){
        $('#report').find('.inline-errors').remove();
        var errors = true;           
                if($("input:checked").val()=== undefined){
                   errors = false;
                   $("#report-spam").after("<p class='inline-errors'>Please Check any one of the list</p>");
                } 
        
        return errors;
    })
}

var reviewFormHandler = function(){

    $("#post_review").click(function(e){
        $('#review').find('.inline-errors').remove();
        var errors = true;
         var comments = $("#review_desc")
        if (comments.val() === '' || comments.val() === undefined) {
            errors = false;
            comments.after("<p class='inline-errors'>can't be blank</p>");
        }
        if($("#review_rating_block input:checked").val()=== undefined){
                   errors = false;
              $("#review_rating_block").after("<p class='inline-errors'>Rating can't be blank</p>");
         }
        return errors;
    })
}
                


$(document).ready(function(){
   reportFormHandler();
   reviewFormHandler();
   $('#comment_submit').live('click' , function(){       
       var errors = true;           
        var comments = $('#new_comment').find('#comment_content');
        if (comments.val() === '' || comments.val() === undefined) {
            errors = false;
            comments.after("<p class='inline-errors'>Review can't be blank</p>");
        }        
        return errors;
   });
   

   
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


 $('a[data-toggle="tab"]').on('show',function (e) {    
 if($(this).attr("href") == "#profile"){
     $('#profile').html('<div style="width: 414px;height: 296px;" ><img src="/assets/lightbox-ico-loading.gif"  alt="spinner" style="margin-top: 100px;margin-left: 150px;" /></div>');
    $.ajax({
        dataType: "script",
        url: "/ads/"+$("#profile").attr('data-id')+"/gmaps" 
       });
 }     
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
        var city = $('#city');
        var state = $('#state');
        var country = $('#country');
	var mobile = $('#mobile');
        var name = $('#contact-form').find('#name');
        var email = $('#contact-form').find('#email');
        var about = $('#contact-form').find('#about');
        var comments = $('#contact-form').find('#comments');
       if (about.val() === '' || about.val() === undefined) {
            errors = true;
            about.after("<span class='inline-errors'>can't be blank</span>");
        }
        if (name.val() === '' || name.val() === undefined) {
            errors = true;
            name.after("<span class='inline-errors'>can't be blank</span>");
        }
       if (city.val() === '' || city.val() === undefined) {
            errors = true;
            city.after("<span class='inline-errors'>can't be blank</span>");
        }  
        if (state.val() === '' || state.val() === undefined) {
            errors = true;
            state.after("<span class='inline-errors'>can't be blank</span>");
        }
       if (country.val() === '' || country.val() === undefined) {
            errors = true;
            country.after("<span class='inline-errors'>can't be blank</span>");
        }
       if (mobile.val() === '' || mobile.val() === undefined || !isValidMobile(mobile.val())) {
            errors = true;
            mobile.after("<span class='inline-errors'>can't be blank or invalid</span>");
        }
        if (email.val() === '' || email.val() === undefined || !isValidEmail(email.val())) {
            errors = true;
            email.after("<span class='inline-errors'>can't be blank or invalid</span>");
        }
        if (comments.val() === '' || comments.val() === undefined) {
            errors = true;
            comments.after("<div class='inline-errors' style='padding: 8px 8px 8px 192px !important;'>can't be blank</div>");
        }
        
        if (!errors) {
            $("#contact-submit").hide();
            $('#contact').find('.loader').show();
            $.ajax({
                type: 'POST',
                url: $('#contact-form').attr('action'),
                data: {
                    name: name.val(),
                    email: email.val(),
                    about: about.val(),
                    comments: comments.val(),
	            city: city.val(),
		    state: state.val(),
		    country: country.val(),
		    mobile: mobile.val()
                },
                success: function(data) {
                    //$('#contact').modal('hide');
                    if (data === 'success') {
			resetContactForm(true);	
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
    $('#contact-form').find('.inline-errors').remove();
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
    $('#contact').find('#city').val('');
    $('#contact').find('#state').val('');
    $('#contact').find('#country').val('');
    $('#contact').find('#mobile').val('');
    $('#contact').find('#name').val('');
    $('#contact').find('#email').val('');
    $('#contact').find('#about').val('');
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


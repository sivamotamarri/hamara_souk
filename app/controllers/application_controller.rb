class ApplicationController < ActionController::Base
  protect_from_forgery
 before_filter :search_obj
 def after_sign_in_path_for(resource)
   if request.env['omniauth.origin']
      request.env['omniauth.origin']
   else    
      signed_in_root_path(resource)
   end 
 end
 
 def search_obj
   @search = Ad.search(params[:search])
 end

end

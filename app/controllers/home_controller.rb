class HomeController < ApplicationController


  def index    
    @motors = Category.section_categories(1)
    @classifieds = Category.section_categories(2)
    @properties_for_sale = Category.section_categories(3)
    @properties_for_rent =Category.section_categories(4)
    @jobs = Category.section_categories(5)
    @communities = Category.section_categories(6)    
  end

  def about
   render :layout => 'common'  
  end
  
  def advertising
   render :layout => 'common'
  end

  def termsandcond
   render :layout => 'common'
  end

  def help
    
  end
  
  def how_to
    
  end
  
  def contact_us
    render :layout => 'common' 
  end
  
  def contact
   
    feedback = ContactMailer.contact_email(params)
   if feedback.deliver
      render :text => 'success', :status => 200
   else
     render :text => 'failed', :status => 200
   end
  end
  # GET /ads/search
  # GET /ads/search.xml
  
#
end

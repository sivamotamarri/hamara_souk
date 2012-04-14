class HomeController < ApplicationController


  def index    
    @classifieds = Category.section_categories(1)
    @properties_for_sale = Category.section_categories(2)
    @properties_for_rent =Category.section_categories(3)
    @jobs = Category.section_categories(4)
    @communities = Category.section_categories(5)    
  end

  
  def help
    
  end
  
  def how_to
    
  end
  
  def contact_us
    
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

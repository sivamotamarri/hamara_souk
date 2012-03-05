class AdsController < ApplicationController
 add_breadcrumb "Home", :root_path
 before_filter :authenticate_user!
  
  def index
    section = Section.find_by_slug(params[:section])
    category = Category.find_by_slug(params[:category]) 
    sub_cat = Category.find_by_slug(params[:sub_category]) 
    if !section.nil? && !category.nil? && !sub_cat.nil?
      options = {}        
      options.deep_merge!(:category_id => category.id)        
      options.deep_merge!(:sub_category_id => sub_cat.id)
      @ads = section.ads.where(options)        
    else
      render :error
    end    
    if section && category && sub_cat
      add_breadcrumb "#{section.name}", section_ad_path
      add_breadcrumb "#{category.name}", category_ad_path
      add_breadcrumb "#{sub_cat.name}" , sub_cat_ad_path  
    end   
  end
  
  
  def new
    session[:ad_step] = session[:ad_params] = nil
    session[:ad_params] ||= {}
    @ad = Ad.new(session[:ad_params])
    @ad.current_step = session[:ad_step]    
  end

  def selection_cat
    @categories = Category.section_categories(params[:id])
    render :layout => false
  end

  def sub_categories
    @sub_categories = Category.child_cat(params[:id])
    render :layout => false
  end

   def create
 
    session[:ad_params].deep_merge!(params[:ad]) if params[:ad]
    @ad = Ad.new(session[:ad_params])
    if session[:ad_step] == "find_on_map"
     4.times do
       @ad.images.build
     end
    end

    @ad.current_step = session[:ad_step]
     if !@ad.first_step?
       @amenities = Amenity.all
     end
     
    if @ad.valid?    
      if params[:back_button]
        @ad.previous_step
      elsif @ad.last_step?
        @ad.user_id = current_user
        @ad.save if @ad.all_valid?
      else
        @ad.next_step
      end
      session[:ad_step] = @ad.current_step   
    end
    
    if params[:ad] && params[:ad][:images_attributes]
      params[:ad][:images_attributes].each_with_index do |t,i|
         params[:ad][:images_attributes]["#{i}"][:attachment].tempfile = nil
      end      
    end   

    if @ad.new_record?     
      render "new"
    else   
      session[:ad_step] = session[:ad_params] = nil
      flash[:notice] = "Ad saved!"
      redirect_to @ad
    end
  end


  def show   
      section = Section.find_by_slug(params[:section])     
      if !section.nil?
       @ad = Ad.find_by_slug_and_section_id(params[:ad],section.id)
       if !@ad.nil? 
        add_breadcrumb "#{section.name}", section_ad_path(section.slug)
        add_breadcrumb "#{@ad.category.name}", category_ad_path(section.slug,@ad.category.slug)
        add_breadcrumb "#{@ad.sub_category.name}" , sub_cat_ad_path(section.slug,@ad.category.slug,@ad.sub_category.slug)  if !@ad.sub_category_id.nil?
        @json = @ad.to_gmaps4rails
       else
         render :error
       end
       add_breadcrumb "details" , ad_details_path(section.slug,@ad.slug)
     else
      render :error
     end 
  end
  
  def search
    @search = Ad.search(params[:search])
    @ads = @search.all
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @search }
    end
  end
end

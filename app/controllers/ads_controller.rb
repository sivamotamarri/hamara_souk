class AdsController < ApplicationController

 before_filter :authenticate_user!
  
  def index
    section = Section.find_by_slug(params[:section])
    if !section.nil?
      options = {}
      if params[:category]
        cat = Category.find_by_slug(params[:category]) 
        options.deep_merge!(:category_id => cat.id)        
      end
      if params[:sub_cat]
        sub_cat = Category.find_by_slug(params[:sub_cat]) 
        options.deep_merge!(:sub_category_id => sub_cat.id)   
      end      
      @ads = section.ads.where(options)        
    else
      render :error
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
    @ad = Ad.find_by_slug(params[:id])
    @json = @ad.to_gmaps4rails
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

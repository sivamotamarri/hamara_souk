class AdsController < ApplicationController

 add_breadcrumb "Home", :root_path
 before_filter :authenticate_user! ,:except => [:show,:new_reply,:reply,:gmaps,:search]

  
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
    puts current_user.id
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
        @ad.user_id = current_user.id
        @ad.save if @ad.all_valid?
      else
        @ad.next_step
      end
      session[:ad_step] = @ad.current_step   
    end
    
    if params[:ad] && params[:ad][:images_attributes]
      params[:ad][:images_attributes].each_with_index do |t,i|
         params[:ad][:images_attributes]["#{i}"][:attachment].tempfile = nil if !params[:ad][:images_attributes]["#{i}"].nil?
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
      @ad = Ad.find_by_slug(params[:id] || params[:ad])
      @report = Report.new
      @review = Review.new
      if !@ad.nil?     
        add_breadcrumb "#{@ad.section.name}", section_ad_path(@ad.section.slug)
        add_breadcrumb "#{@ad.category.name}", category_ad_path(@ad.section.slug,@ad.category.slug)
        add_breadcrumb "#{@ad.sub_category.name}" , sub_cat_ad_path(@ad.section.slug,@ad.category.slug,@ad.sub_category.slug)  if !@ad.sub_category_id.nil?
       
        if !params[:ad].nil?
          add_breadcrumb "details" , ad_details_path(@ad.section.slug,@ad.slug)
        else
          add_breadcrumb "details" , ad_path(@ad.slug)
        end
       else
         render :error
     end 
  end

  def gmaps
    @ad = Ad.find_by_slug(params[:id])
    @json = @ad.to_gmaps4rails
    respond_to do |format|
      format.html { }
      format.js  {}
    end
  end
  
  def search
    @search = Ad.search(params[:search])
    @ads = @search.paginate(:page => params[:page], :per_page => 1)
    respond_to do |format|
      format.html { }
      format.xml  { render :xml => @search }
    end
  end
  
  def new_reply
    @ad = Ad.find(params[:id])
    @reply = Reply.new    
    render :layout => false
  end

  def report
    @report = Report.new(params[:report])
    @report.reported_by = current_user.id
    if @report.save
      flash[:notice] = "Report Successfully Created."
      redirect_to ad_path(params[:ad])
    else
      flash[:notice] = "Report Unsuccessfull"
      redirect_to ad_path(params[:ad])
    end
  end
  
  def reply
     @reply = Reply.new(params[:reply])
    if @reply.save
      render :text => 'success', :status => 200
    else
      render :text => 'failed', :status => 200
    end
  end
end

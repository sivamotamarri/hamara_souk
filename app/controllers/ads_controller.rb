class AdsController < ApplicationController

 before_filter :authenticate_user!

  def new
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
    @ad.current_step = session[:ad_step]
     if !@ad.first_step?
       @amenities = Amenity.all
     end
     puts @ad.section_id
    if @ad.valid?    
      if params[:back_button]
        @ad.previous_step
      elsif @ad.last_step?      
        @ad.save if @ad.all_valid?
      else  
        @ad.next_step
      end
      session[:ad_step] = @ad.current_step
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
    @ad = Ad.find_by_id(params[:id])
  end
end

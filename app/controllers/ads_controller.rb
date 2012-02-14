class AdsController < ApplicationController

 before_filter :authenticate_user!
  def new
    @ad = Ad.new
    @amenities = Amenity.all
  end
  def step2
    @amenities = Amenity.all
  end
  def step3
     
  end
  def step4
    
  end
  
  def create
    render :text => params.inspect
  end
  def show
    render :text => "heell"
  end
end

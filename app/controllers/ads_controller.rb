class AdsController < ApplicationController
  
  def new
    @ad = Ad.new
  end
  
  def create
    
  end
  def show
    render :text => "heell"
  end
end

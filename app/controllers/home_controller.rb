class HomeController < ApplicationController


  def index
    @classifieds = Ad.classifieds
    @properties_for_sale = Ad.properties_for_sale
    @properties_for_rent = Ad.properties_for_rent
    @jobs = Ad.jobs
    @communities = Ad.communities
  end

  # GET /ads/search
  # GET /ads/search.xml
#  def search
#    @ads = ad.search do
#      keywords params[:query]
#    end.results
#
#    respond_to do |format|
#      format.html { render :action => "index" }
#      format.xml  { render :xml => @ads }
#    end
#  end
#
end

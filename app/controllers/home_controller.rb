class HomeController < ApplicationController


  def index
    @classifieds = Category.section_categories(1)
    @properties_for_sale = Category.section_categories(2)
    @properties_for_rent =Category.section_categories(3)
    @jobs = Category.section_categories(4)
    @communities = Category.section_categories(5)
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

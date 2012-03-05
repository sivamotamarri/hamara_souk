class SectionsController < ApplicationController
  add_breadcrumb "Home", :root_path
  def index
    section = Section.find_by_slug(params[:section])
    add_breadcrumb "#{section.name}", section_ad_path
  end
  
  def show
    section = Section.find_by_slug(params[:section])
    category = Category.find_by_slug(params[:category])
    if section && category
      add_breadcrumb "#{section.name}", section_ad_path
      add_breadcrumb "#{category.name}", category_ad_path
    end
  end
  
  
end

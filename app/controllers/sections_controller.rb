class SectionsController < ApplicationController
  add_breadcrumb "Home", :root_path
  def index
    section = Section.find_by_slug(params[:section])
    add_breadcrumb "#{section.name}", section_ad_path
    @categories = Category.section_categories(section.id)
    @ads = section.ads
  end
  
  def details
    section = Section.find_by_slug(params[:section])
    category = Category.find_by_slug(params[:category])
    if section && category
      add_breadcrumb "#{section.name}", section_ad_path
      add_breadcrumb "#{category.name}", category_ad_path
    end
    @sub_cat = Category.child_cat(category.id)
    @ads = category.ads
  end
  
  
end

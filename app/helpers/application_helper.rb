module ApplicationHelper
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  
  def sec_categories(cats)    
    res = content_tag(:option,"" ,:value => "") 
    cats.each do |cat|
     res = res + content_tag(:option,cat.name ,:value => cat.id) 
    end
   res
  end

  def ads_count(sec_id,cat_id)
    Ad.category_ads(sec_id,cat_id).count
  end
  
  def sections
    @sections = Section.all
    res = content_tag(:li,content_tag(:a ,"",:href=> "/") ,:class => "home-tab")
    @sections.each do |sec|
      res = res + content_tag(:li , content_tag(:a , sec.name, :href => "/#{sec.slug}"))
    end
    res = res + content_tag(:li,content_tag(:a ,"Contact Us",:href=> contact_us_path) ,:class => "last")
    res
  end

end

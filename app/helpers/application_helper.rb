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

end

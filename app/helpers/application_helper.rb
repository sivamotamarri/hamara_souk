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

end

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
    if user_signed_in?
     res = res + content_tag(:li , content_tag(:a, "Discussions", :href => forums_url) ,:class => "last")
    else
     res = res + content_tag(:li,content_tag(:a ,"Contact Us",:href=> '#contact', "data-toggle" => "modal") ,:class => "last")
    end
     res
  end
  
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end
  
  def shortener(url)
    authorize = UrlShortener::Authorize.new 'hamarasouk', 'R_602bd0d1e35aba4758c58b5a0eb6fffd'
    client = UrlShortener::Client.new(authorize)
    shorten = client.shorten(url)
    shorten.urls
  end
  
  def user_display_pic(user, size)
    if user.avatar_file_name && (user.errors[:avatar_content_type].blank? && user.errors[:avatar_file_size].blank?)
      image_tag(user.avatar.url, :alt => 'Pic', :size => size)
    else
      image_tag('default_profile_pic.gif', :alt => 'Pic', :size => size)
    end
  end

end

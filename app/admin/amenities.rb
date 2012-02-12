ActiveAdmin.register Amenity do
#form :partial => "form"
 form do |f|
    f.inputs "Admin Amenity creation" do
      f.input :title
      f.input :section
    
      f.input :category , :input_html => {:disabled => "disabled"}
    
    end
    f.buttons
  end
  
  member_action :category_selection, :method => :get do
    @categories = Category.section_categories(params[:id])
#      user = User.find(params[:id])
#      user.lock!      
  end
end

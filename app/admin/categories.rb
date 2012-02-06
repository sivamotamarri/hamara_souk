ActiveAdmin.register Category do
  index do
    column :name do |cat|  
        link_to cat.name, admin_category_path(cat)  
    end  
    column "description" , :desc
    column "Parent Category" , :parent , :sortable => :parent_id
    column "Section" , :section , :sortable => :section_id
    column "Created Date", :created_at
    default_actions
  end
end

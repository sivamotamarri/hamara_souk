ActiveAdmin.register Category do
  index do
    column :name do |cat|  
        link_to cat.name, admin_category_path(cat)  
    end     
    column "Parent Category" , :parent , :sortable => :parent_id
    column "Section" , :section , :sortable => :section_id do |cat|
      cat.section.name
    end
    column "Created Date", :created_at
    default_actions
  end
  show do |cat|
      attributes_table do
        row :name
        row :desc
        row :parent
        row :status
        row :section do
          cat.section.name
        end
      end
      active_admin_comments
  end
end

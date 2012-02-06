ActiveAdmin.register Section do
index do
    column :name
    column "Created Date", :created_at
    default_actions
  end 
end

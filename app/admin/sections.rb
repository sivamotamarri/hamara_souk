ActiveAdmin.register Section do

menu false

index do
    column :name
    column "Created Date", :created_at
    default_actions
  end 
end

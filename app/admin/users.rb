ActiveAdmin.register User do
  index do                            
    column :email                     
    column :name
    column :location
    column :provider        
    column :last_sign_in_at           
    column :sign_in_count             
    default_actions                   
  end                                 

  filter :email
end

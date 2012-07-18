ActiveAdmin.register Video do

  controller do
    before_filter :authenticate_admin_user!, :except => [:index]
  end

  form do |f|
    f.inputs "Details" do 
      f.input :category_id, :as => :select, :collection => Category.all
      f.input :name
      f.input :video_url
    end
    f.buttons
  end
end
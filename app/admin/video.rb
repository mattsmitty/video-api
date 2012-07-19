ActiveAdmin.register Video do

  form do |f|
    f.inputs "Details" do 
      f.input :category_id, :as => :select, :collection => Category.all
      f.input :name
      f.input :video_url
      f.input :duration
    end
    f.buttons
  end
end
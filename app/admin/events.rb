ActiveAdmin.register Event do
  form do |f|
    f.inputs do
      f.input :title
      f.input :desc
    end

    f.inputs "images" do
      f.has_many :images do |j|
        j.inputs :attachment
      end
    end

    f.buttons
  end
end

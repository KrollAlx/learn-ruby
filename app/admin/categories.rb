ActiveAdmin.register Category do
  menu label: "Категории"
  permit_params :title

  form do |f|
    f.inputs do
      f.input :title

      f.actions
    end
  end
end

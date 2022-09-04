ActiveAdmin.register Answer do
  menu label: "Ответы"
  permit_params :text, :question_id
end

ActiveAdmin.register Test do
  menu priority: 1, label: "Тесты"
  permit_params :title, :description, :category_id

  show do
    panel "Вопросы" do
      table_for test.questions do
        column :text
        column :right_answer
      end
    end
  end
end

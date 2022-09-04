ActiveAdmin.register Question do
  menu label: "Вопросы"
  permit_params :text, :test_id, :right_answer_id

  show do
    attributes_table :text, :test, :right_answer

    panel "Ответы" do
      table_for question.answers do
        column :text
      end
    end
  end
end

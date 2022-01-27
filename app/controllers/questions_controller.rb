class QuestionsController < ApplicationController
  def start
    @questions = Test.find(params[:test_id]).questions
    @current_question_index = 0
    @right_answers_count = 0
    redirect_to question_show_path(questions.first.id)
  end

  def show
    @question = Question.find(params[:question_id])
  end

  def answer
    @current_question_index += 1
    @right_answers_count += 1 if params[:answer] == @question.right_answer

    if @questions.size == @current_question_index
      # подсчитать результат теста и вывести итоги
    end

    redirect_to question_show_path(@questions[@current_question_index])
  end

  # вывод итогов теста
  def result
  end
end

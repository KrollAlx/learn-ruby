class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:question_id])
    @count_questions = TestsService.count_questions
    @current_question_index = TestsService.current_question_index
  end

  def answer
    TestsService.answer(params[:answer].to_i)

    if TestsService.test_completed?
      redirect_to test_result_path(TestsService.test)
    else
      redirect_to question_show_path(TestsService.next_question)
    end
  end
end

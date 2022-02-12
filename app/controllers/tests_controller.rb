class TestsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def start
    test = Test.find(params[:test_id])
    TestsService.start_test(test)
    redirect_to question_show_path(test.questions.first)
  end

  def result
    @right_answers_count = TestsService.right_answers_count
    @count_questions = TestsService.count_questions
    @results = TestsService.results
    @questions = TestsService.questions
  end
end

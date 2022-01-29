class TestsService
  class << self
    attr_reader :count_questions, :right_answers_count, :test

    def start_test(test)
      @test = test
      @questions = test.questions
      @count_questions = @questions.size
      @current_question_index = 0
      @right_answers_count = 0
    end

    def answer(answer)
      question = @questions[@current_question_index]
      @right_answers_count += 1 if question.right_answer == answer
      @current_question_index += 1
    end

    def next_question
      @questions[@current_question_index]
    end

    def test_completed?
      @current_question_index == @questions.size
    end

    def current_question_index
      @current_question_index + 1
    end

    def test_results
    end
  end
end
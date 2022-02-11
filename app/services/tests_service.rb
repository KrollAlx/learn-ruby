class TestsService
  class << self
    attr_reader :count_questions, :right_answers_count, :test, :results, :questions

    def start_test(test)
      @test = test
      @questions = test.questions
      @count_questions = @questions.size
      @current_question_index = 0
      @right_answers_count = 0
      @results = []
    end

    def answer(answer_id)
      user_answer = Answer.find(answer_id)
      question = @questions[@current_question_index]

      if question.right_answer.id == user_answer.id
        @right_answers_count += 1
        @results.push({ answer: user_answer.text, result: 'правильный' })
      else
        @results.push({ answer: user_answer.text, result: 'неправильный' })
      end

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

    def complete_test(user)
      CompletedTest.create!(user: user, test: @test,
                            right_answers_count: @right_answers_count,
                            questions_count: @count_questions)
    end
  end
end
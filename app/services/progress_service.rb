class ProgressService
  class << self
    def completed_tests(user)
      Test.all.select { |t| t.number_tries(user).positive? }
    end

    def completed_tests_records(user, test)
      CompletedTest.where(user: user, test: test)
    end
  end
end
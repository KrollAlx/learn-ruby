class ProgressController < ApplicationController
  before_action :authenticate_user!

  def show
    @completed_tests = ProgressService.completed_tests(current_user)
    @completed_tests_count = @completed_tests.count
    @test_count = Test.count
  end

  def details
    @test = Test.find(params[:test_id])
    @completed_tests_records = ProgressService.completed_tests_records(current_user, @test)

    respond_to do |format|
      format.turbo_stream
    end
  end

  def hide
    @completed_test = Test.find(params[:test_id])

    respond_to do |format|
      format.turbo_stream
    end
  end
end

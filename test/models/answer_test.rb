require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  test "simple create a single standalone answer" do
    q = Question.create(question: "This is a test question")
    a = q.answers.create(body: "This is a test answer")
    assert a.valid?
  end

  test "all amswers belong to some question" do
    a = Answer.create(body: "Test Body")
    refute a.valid?
  end
end

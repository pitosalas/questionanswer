require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  def setup
    @q1 = Question.new(question: "Hello", body: "Hello Hello")
  end
  test "simple invocation of word utils" do
    w = Question.create(question: "What is the meaning of life, the universe, and everything?")
    assert w.valid?
  end

  test "association with answer" do
    assert_equal 0, @q1.answers.count
    @q1.answers.build(body: "Hello Hello")
    assert_equal 1, @q1.answers.count
  end

  test "answer knows its questiion" do
    a = @q1.answers.create(body: "Hello Hello")
    assert_equal @q1, a.question
  end
end

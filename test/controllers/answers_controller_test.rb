require "test_helper"

class AnswersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @answer = answers(:no_idea)
    @question = @answer.question
  end

  test "should get index" do
    get question_answers_url(@question, @answer)
    assert_response :success
  end

  test "should get new" do
    get new_question_answer_url(@question)
    assert_response :success
  end

  test "should create answer" do
    assert_difference("Answer.count") do
      post question_answers_url(@question), params: {answer: {body: @answer.body, question_id: @answer.question_id}}
    end

    assert_redirected_to question_answer_url(@question, @answer)
  end

  test "should show answer" do
    get question_answers_url(@question, @answer)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_answer_url(@question, @answer)
    assert_response :success
  end

  test "should update answer" do
    patch answer_url(@answer), params: {answer: {body: @answer.body, question_id: @answer.question_id}}
    assert_redirected_to answer_url(@answer)
  end

  test "should destroy answer" do
    assert_no_difference("Question.count") do
      delete answer_url(@answer)
    end

    assert_redirected_to answers_url
  end
end

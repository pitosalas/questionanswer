class AnswersController < ApplicationController
  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def show
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to question_url(@question), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to question_url(@question), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])

    if !@answer.comments.empty?
      redirect = question_url(@question)
      notice = "First delete all the comments"
    elsif @answer.destroy
      puts "--"
      redirect = question_url(@question)
      notice = "Answer was successfully destroyed."
    else
      puts "----"
      redirect = question_url(@question)
      notice = "Answer could not be destroyed."
    end

    respond_to do |format|
      format.html { redirect_to redirect, notice: notice }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :question_id)
  end
end

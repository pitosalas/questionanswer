class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy ]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
    @answer = @question.answers.new
    puts @answer
  end

  # GET /questions/new
  def new
    session[:pito] = "hello world"
    stateless = "hello world"
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    puts "...................." + session[:pito]
    puts stateless
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_url, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    respond_to do |format|
      if !@question.answers.empty?
        format.html { redirect_to questions_url, notice: "First delete all the answers" }
      elsif @question.destroy!
        format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      else
        format.html { redirect_to questions_url, notice: "Question could not be destroyed." }
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def question_params
    out = params.require(:question).permit(:question, :body, :answer)
    out
  end
end

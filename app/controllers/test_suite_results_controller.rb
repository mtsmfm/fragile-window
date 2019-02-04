class TestSuiteResultsController < ApplicationController
  # FIXME
  skip_before_action :verify_authenticity_token

  before_action :set_test_suite_result, only: [:show, :edit, :update, :destroy]

  # GET /test_suite_results
  # GET /test_suite_results.json
  def index
    @test_suite_results = TestSuiteResult.all
  end

  # GET /test_suite_results/1
  # GET /test_suite_results/1.json

  def show
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @test_suite_result.ok? }
    end
  end

  # GET /test_suite_results/new
  def new
    @test_suite_result = TestSuiteResult.new
  end

  # GET /test_suite_results/1/edit
  def edit
  end

  # POST /test_suite_results
  # POST /test_suite_results.json
  def create
    @test_suite_result = TestSuiteResult.new(test_suite_result_params.merge(data: test_suite_result_params[:data].read))

    respond_to do |format|
      if @test_suite_result.save
        ImportTestSuiteResultJob.perform_later(@test_suite_result)

        format.html { redirect_to @test_suite_result, notice: 'Test suite result was successfully created.' }
        format.json { render json: @test_suite_result.ok? }
      else
        format.html { render :new }
        format.json { render json: @test_suite_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_suite_results/1
  # PATCH/PUT /test_suite_results/1.json
  def update
    respond_to do |format|
      if @test_suite_result.update(test_suite_result_params)
        format.html { redirect_to @test_suite_result, notice: 'Test suite result was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_suite_result }
      else
        format.html { render :edit }
        format.json { render json: @test_suite_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_suite_results/1
  # DELETE /test_suite_results/1.json
  def destroy
    @test_suite_result.destroy
    respond_to do |format|
      format.html { redirect_to test_suite_results_url, notice: 'Test suite result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_suite_result
      @test_suite_result = TestSuiteResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_suite_result_params
      params.require(:test_suite_result).permit(:data, :test_suite_id, :original_url)
    end
end

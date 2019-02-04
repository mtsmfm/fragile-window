class TestExampleResultsController < ApplicationController
  before_action :set_test_example_result, only: [:show, :edit, :update, :destroy]

  # GET /test_example_results
  # GET /test_example_results.json
  def index
    @test_example_results = TestExampleResult.all
  end

  # GET /test_example_results/1
  # GET /test_example_results/1.json
  def show
  end

  # GET /test_example_results/new
  def new
    @test_example_result = TestExampleResult.new
  end

  # GET /test_example_results/1/edit
  def edit
  end

  # POST /test_example_results
  # POST /test_example_results.json
  def create
    @test_example_result = TestExampleResult.new(test_example_result_params)

    respond_to do |format|
      if @test_example_result.save
        format.html { redirect_to @test_example_result, notice: 'Test example result was successfully created.' }
        format.json { render :show, status: :created, location: @test_example_result }
      else
        format.html { render :new }
        format.json { render json: @test_example_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_example_results/1
  # PATCH/PUT /test_example_results/1.json
  def update
    respond_to do |format|
      if @test_example_result.update(test_example_result_params)
        format.html { redirect_to @test_example_result, notice: 'Test example result was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_example_result }
      else
        format.html { render :edit }
        format.json { render json: @test_example_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_example_results/1
  # DELETE /test_example_results/1.json
  def destroy
    @test_example_result.destroy
    respond_to do |format|
      format.html { redirect_to test_example_results_url, notice: 'Test example result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_example_result
      @test_example_result = TestExampleResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_example_result_params
      params.require(:test_example_result).permit(:result, :run_time, :test_example_id, :test_suite_result_id)
    end
end

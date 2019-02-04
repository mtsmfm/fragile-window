class TestSuitesController < ApplicationController
  before_action :set_test_suite, only: [:show, :edit, :update, :destroy]

  # GET /test_suites
  # GET /test_suites.json
  def index
    @test_suites = TestSuite.all
  end

  # GET /test_suites/1
  # GET /test_suites/1.json
  def show
  end

  # GET /test_suites/new
  def new
    @test_suite = TestSuite.new
  end

  # GET /test_suites/1/edit
  def edit
  end

  # POST /test_suites
  # POST /test_suites.json
  def create
    @test_suite = TestSuite.new(test_suite_params)

    respond_to do |format|
      if @test_suite.save
        format.html { redirect_to @test_suite, notice: 'Test suite was successfully created.' }
        format.json { render :show, status: :created, location: @test_suite }
      else
        format.html { render :new }
        format.json { render json: @test_suite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_suites/1
  # PATCH/PUT /test_suites/1.json
  def update
    respond_to do |format|
      if @test_suite.update(test_suite_params)
        format.html { redirect_to @test_suite, notice: 'Test suite was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_suite }
      else
        format.html { render :edit }
        format.json { render json: @test_suite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_suites/1
  # DELETE /test_suites/1.json
  def destroy
    @test_suite.destroy
    respond_to do |format|
      format.html { redirect_to test_suites_url, notice: 'Test suite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_suite
      @test_suite = TestSuite.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_suite_params
      params.require(:test_suite).permit(:name)
    end
end

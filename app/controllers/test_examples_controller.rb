class TestExamplesController < ApplicationController
  before_action :set_test_example, only: [:show, :edit, :update, :destroy]

  # GET /test_examples
  # GET /test_examples.json
  def index
    @test_examples = TestExample.all
  end

  # GET /test_examples/1
  # GET /test_examples/1.json
  def show
  end

  # GET /test_examples/new
  def new
    @test_example = TestExample.new
  end

  # GET /test_examples/1/edit
  def edit
  end

  # POST /test_examples
  # POST /test_examples.json
  def create
    @test_example = TestExample.new(test_example_params)

    respond_to do |format|
      if @test_example.save
        format.html { redirect_to @test_example, notice: 'Test example was successfully created.' }
        format.json { render :show, status: :created, location: @test_example }
      else
        format.html { render :new }
        format.json { render json: @test_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_examples/1
  # PATCH/PUT /test_examples/1.json
  def update
    respond_to do |format|
      if @test_example.update(test_example_params)
        format.html { redirect_to @test_example, notice: 'Test example was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_example }
      else
        format.html { render :edit }
        format.json { render json: @test_example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_examples/1
  # DELETE /test_examples/1.json
  def destroy
    @test_example.destroy
    respond_to do |format|
      format.html { redirect_to test_examples_url, notice: 'Test example was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_example
      @test_example = TestExample.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_example_params
      params.require(:test_example).permit(:name, :classname, :file, :pending, :test_suite_id)
    end
end

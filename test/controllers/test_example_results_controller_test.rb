require 'test_helper'

class TestExampleResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_example_result = test_example_results(:one)
  end

  test "should get index" do
    get test_example_results_url
    assert_response :success
  end

  test "should get new" do
    get new_test_example_result_url
    assert_response :success
  end

  test "should create test_example_result" do
    assert_difference('TestExampleResult.count') do
      post test_example_results_url, params: { test_example_result: { result: @test_example_result.result, run_time: @test_example_result.run_time, test_example_id: @test_example_result.test_example_id, test_suite_result_id: @test_example_result.test_suite_result_id } }
    end

    assert_redirected_to test_example_result_url(TestExampleResult.last)
  end

  test "should show test_example_result" do
    get test_example_result_url(@test_example_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_example_result_url(@test_example_result)
    assert_response :success
  end

  test "should update test_example_result" do
    patch test_example_result_url(@test_example_result), params: { test_example_result: { result: @test_example_result.result, run_time: @test_example_result.run_time, test_example_id: @test_example_result.test_example_id, test_suite_result_id: @test_example_result.test_suite_result_id } }
    assert_redirected_to test_example_result_url(@test_example_result)
  end

  test "should destroy test_example_result" do
    assert_difference('TestExampleResult.count', -1) do
      delete test_example_result_url(@test_example_result)
    end

    assert_redirected_to test_example_results_url
  end
end

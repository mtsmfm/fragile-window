require 'test_helper'

class TestSuiteResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_suite_result = test_suite_results(:one)
  end

  test "should get index" do
    get test_suite_results_url
    assert_response :success
  end

  test "should get new" do
    get new_test_suite_result_url
    assert_response :success
  end

  test "should create test_suite_result" do
    assert_difference('TestSuiteResult.count') do
      post test_suite_results_url, params: { test_suite_result: { data: @test_suite_result.data, test_suite_id: @test_suite_result.test_suite_id } }
    end

    assert_redirected_to test_suite_result_url(TestSuiteResult.last)
  end

  test "should show test_suite_result" do
    get test_suite_result_url(@test_suite_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_suite_result_url(@test_suite_result)
    assert_response :success
  end

  test "should update test_suite_result" do
    patch test_suite_result_url(@test_suite_result), params: { test_suite_result: { data: @test_suite_result.data, test_suite_id: @test_suite_result.test_suite_id } }
    assert_redirected_to test_suite_result_url(@test_suite_result)
  end

  test "should destroy test_suite_result" do
    assert_difference('TestSuiteResult.count', -1) do
      delete test_suite_result_url(@test_suite_result)
    end

    assert_redirected_to test_suite_results_url
  end
end

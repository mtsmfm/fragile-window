require 'test_helper'

class TestSuitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_suite = test_suites(:one)
  end

  test "should get index" do
    get test_suites_url
    assert_response :success
  end

  test "should get new" do
    get new_test_suite_url
    assert_response :success
  end

  test "should create test_suite" do
    assert_difference('TestSuite.count') do
      post test_suites_url, params: { test_suite: { name: @test_suite.name } }
    end

    assert_redirected_to test_suite_url(TestSuite.last)
  end

  test "should show test_suite" do
    get test_suite_url(@test_suite)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_suite_url(@test_suite)
    assert_response :success
  end

  test "should update test_suite" do
    patch test_suite_url(@test_suite), params: { test_suite: { name: @test_suite.name } }
    assert_redirected_to test_suite_url(@test_suite)
  end

  test "should destroy test_suite" do
    assert_difference('TestSuite.count', -1) do
      delete test_suite_url(@test_suite)
    end

    assert_redirected_to test_suites_url
  end
end

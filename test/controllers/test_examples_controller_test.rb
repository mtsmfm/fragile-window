require 'test_helper'

class TestExamplesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_example = test_examples(:one)
  end

  test "should get index" do
    get test_examples_url
    assert_response :success
  end

  test "should get new" do
    get new_test_example_url
    assert_response :success
  end

  test "should create test_example" do
    assert_difference('TestExample.count') do
      post test_examples_url, params: { test_example: { classname: @test_example.classname, file: @test_example.file, name: @test_example.name, pending: @test_example.pending, test_suite_id: @test_example.test_suite_id } }
    end

    assert_redirected_to test_example_url(TestExample.last)
  end

  test "should show test_example" do
    get test_example_url(@test_example)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_example_url(@test_example)
    assert_response :success
  end

  test "should update test_example" do
    patch test_example_url(@test_example), params: { test_example: { classname: @test_example.classname, file: @test_example.file, name: @test_example.name, pending: @test_example.pending, test_suite_id: @test_example.test_suite_id } }
    assert_redirected_to test_example_url(@test_example)
  end

  test "should destroy test_example" do
    assert_difference('TestExample.count', -1) do
      delete test_example_url(@test_example)
    end

    assert_redirected_to test_examples_url
  end
end

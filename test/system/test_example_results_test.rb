require "application_system_test_case"

class TestExampleResultsTest < ApplicationSystemTestCase
  setup do
    @test_example_result = test_example_results(:one)
  end

  test "visiting the index" do
    visit test_example_results_url
    assert_selector "h1", text: "Test Example Results"
  end

  test "creating a Test example result" do
    visit test_example_results_url
    click_on "New Test Example Result"

    fill_in "Result", with: @test_example_result.result
    fill_in "Run time", with: @test_example_result.run_time
    fill_in "Test example", with: @test_example_result.test_example_id
    fill_in "Test suite result", with: @test_example_result.test_suite_result_id
    click_on "Create Test example result"

    assert_text "Test example result was successfully created"
    click_on "Back"
  end

  test "updating a Test example result" do
    visit test_example_results_url
    click_on "Edit", match: :first

    fill_in "Result", with: @test_example_result.result
    fill_in "Run time", with: @test_example_result.run_time
    fill_in "Test example", with: @test_example_result.test_example_id
    fill_in "Test suite result", with: @test_example_result.test_suite_result_id
    click_on "Update Test example result"

    assert_text "Test example result was successfully updated"
    click_on "Back"
  end

  test "destroying a Test example result" do
    visit test_example_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test example result was successfully destroyed"
  end
end

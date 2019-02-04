require "application_system_test_case"

class TestSuiteResultsTest < ApplicationSystemTestCase
  setup do
    @test_suite_result = test_suite_results(:one)
  end

  test "visiting the index" do
    visit test_suite_results_url
    assert_selector "h1", text: "Test Suite Results"
  end

  test "creating a Test suite result" do
    visit test_suite_results_url
    click_on "New Test Suite Result"

    fill_in "Data", with: @test_suite_result.data
    fill_in "Test suite", with: @test_suite_result.test_suite_id
    click_on "Create Test suite result"

    assert_text "Test suite result was successfully created"
    click_on "Back"
  end

  test "updating a Test suite result" do
    visit test_suite_results_url
    click_on "Edit", match: :first

    fill_in "Data", with: @test_suite_result.data
    fill_in "Test suite", with: @test_suite_result.test_suite_id
    click_on "Update Test suite result"

    assert_text "Test suite result was successfully updated"
    click_on "Back"
  end

  test "destroying a Test suite result" do
    visit test_suite_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test suite result was successfully destroyed"
  end
end

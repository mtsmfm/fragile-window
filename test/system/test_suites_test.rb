require "application_system_test_case"

class TestSuitesTest < ApplicationSystemTestCase
  setup do
    @test_suite = test_suites(:one)
  end

  test "visiting the index" do
    visit test_suites_url
    assert_selector "h1", text: "Test Suites"
  end

  test "creating a Test suite" do
    visit test_suites_url
    click_on "New Test Suite"

    fill_in "Name", with: @test_suite.name
    click_on "Create Test suite"

    assert_text "Test suite was successfully created"
    click_on "Back"
  end

  test "updating a Test suite" do
    visit test_suites_url
    click_on "Edit", match: :first

    fill_in "Name", with: @test_suite.name
    click_on "Update Test suite"

    assert_text "Test suite was successfully updated"
    click_on "Back"
  end

  test "destroying a Test suite" do
    visit test_suites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test suite was successfully destroyed"
  end
end

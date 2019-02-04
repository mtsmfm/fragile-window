require "application_system_test_case"

class TestExamplesTest < ApplicationSystemTestCase
  setup do
    @test_example = test_examples(:one)
  end

  test "visiting the index" do
    visit test_examples_url
    assert_selector "h1", text: "Test Examples"
  end

  test "creating a Test example" do
    visit test_examples_url
    click_on "New Test Example"

    fill_in "Classname", with: @test_example.classname
    fill_in "File", with: @test_example.file
    fill_in "Name", with: @test_example.name
    check "Pending" if @test_example.pending
    fill_in "Test suite", with: @test_example.test_suite_id
    click_on "Create Test example"

    assert_text "Test example was successfully created"
    click_on "Back"
  end

  test "updating a Test example" do
    visit test_examples_url
    click_on "Edit", match: :first

    fill_in "Classname", with: @test_example.classname
    fill_in "File", with: @test_example.file
    fill_in "Name", with: @test_example.name
    check "Pending" if @test_example.pending
    fill_in "Test suite", with: @test_example.test_suite_id
    click_on "Update Test example"

    assert_text "Test example was successfully updated"
    click_on "Back"
  end

  test "destroying a Test example" do
    visit test_examples_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Test example was successfully destroyed"
  end
end

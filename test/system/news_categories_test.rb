require "application_system_test_case"

class NewsCategoriesTest < ApplicationSystemTestCase
  setup do
    @news_category = news_categories(:one)
  end

  test "visiting the index" do
    visit news_categories_url
    assert_selector "h1", text: "News Categories"
  end

  test "creating a News category" do
    visit news_categories_url
    click_on "New News Category"

    fill_in "Desc", with: @news_category.desc
    fill_in "Name", with: @news_category.name
    click_on "Create News category"

    assert_text "News category was successfully created"
    click_on "Back"
  end

  test "updating a News category" do
    visit news_categories_url
    click_on "Edit", match: :first

    fill_in "Desc", with: @news_category.desc
    fill_in "Name", with: @news_category.name
    click_on "Update News category"

    assert_text "News category was successfully updated"
    click_on "Back"
  end

  test "destroying a News category" do
    visit news_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "News category was successfully destroyed"
  end
end

require 'test_helper'

class NewsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_category = news_categories(:one)
  end

  test "should get index" do
    get news_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_news_category_url
    assert_response :success
  end

  test "should create news_category" do
    assert_difference('NewsCategory.count') do
      post news_categories_url, params: { news_category: { desc: @news_category.desc, name: @news_category.name } }
    end

    assert_redirected_to news_category_url(NewsCategory.last)
  end

  test "should show news_category" do
    get news_category_url(@news_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_category_url(@news_category)
    assert_response :success
  end

  test "should update news_category" do
    patch news_category_url(@news_category), params: { news_category: { desc: @news_category.desc, name: @news_category.name } }
    assert_redirected_to news_category_url(@news_category)
  end

  test "should destroy news_category" do
    assert_difference('NewsCategory.count', -1) do
      delete news_category_url(@news_category)
    end

    assert_redirected_to news_categories_url
  end
end

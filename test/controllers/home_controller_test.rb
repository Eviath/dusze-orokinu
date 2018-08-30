require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get sojusz" do
    get home_sojusz_url
    assert_response :success
  end

  test "should get aktualnosci" do
    get home_aktualnosci_url
    assert_response :success
  end

  test "should get warframe" do
    get home_warframe_url
    assert_response :success
  end

  test "should get kontakt" do
    get home_kontakt_url
    assert_response :success
  end

  test "should get informacje" do
    get home_informacje_url
    assert_response :success
  end

end

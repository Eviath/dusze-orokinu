require 'test_helper'

class SojuszControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sojusz_index_url
    assert_response :success
  end

  test "should get aktualnosci" do
    get sojusz_aktualnosci_url
    assert_response :success
  end

  test "should get warframe" do
    get sojusz_warframe_url
    assert_response :success
  end

  test "should get kontakt" do
    get sojusz_kontakt_url
    assert_response :success
  end

  test "should get informacje" do
    get sojusz_informacje_url
    assert_response :success
  end

end

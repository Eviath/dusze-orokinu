require 'test_helper'

class RequestTest < ActiveSupport::TestCase

  def setup
     @user = users(:michael)
     @request = @user.build_request(nickname: "Eviath", lider_nickname: "Eviath", clan_name: "Sneaky Victors",
       clan_members: 80, clan_tier: "Storm", clan_about: "Fajny klan.", discord_check: '', rule_check: '')
     end

     test "discord check should be true" do
       @request.discord_check = true
       assert_not @request.valid?
     end

     test "discord check should be true" do
       @request.rule_check = true
       assert_not @request.valid?
     end


   test "should be valid" do
     assert @request.valid?
   end

   test "user id should be present" do
     @request.user_id = nil
     assert_not @request.valid?
   end

   test "nickname should be present" do
     @request.nickname = nil
     assert_not @request.valid?
   end

   test "lider nickname should be present" do
     @request.lider_nickname = nil
     assert_not @request.valid?
   end

   test "clan name should be present" do
     @request.clan_name = nil
     assert_not @request.valid?
   end

   test "clan members should be present" do
     @request.clan_members = nil
     assert_not @request.valid?
   end

   test "clan tier should be present" do
     @request.clan_tier = nil
     assert_not @request.valid?
   end

   test "clan about should be present" do
     @request.clan_about = nil
     assert_not @request.valid?
   end


   test "order should be most recent first" do
    assert_equal requests(:most_recent), Request.first
  end


end

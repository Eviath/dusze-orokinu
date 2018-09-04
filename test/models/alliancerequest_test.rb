require 'test_helper'

class AlliancerequestTest < ActiveSupport::TestCase

  def setup
     @user = users(:michael)
     @alliancerequest = @user.build_alliancerequest(nickname: "Eviath", lider_nickname: "Eviath", clan_name: "Sneaky Victors",
       clan_members: 80, clan_tier: "Storm", clan_about: "Fajny klan.")
     end



   test "should be valid" do
     assert @alliancerequest.valid?
   end

   test "user id should be present" do
     @alliancerequest.user_id = nil
     assert_not @alliancerequest.valid?
   end

   test "nickname should be present" do
     @alliancerequest.nickname = nil
     assert_not @alliancerequest.valid?
   end

   test "lider nickname should be present" do
     @alliancerequest.lider_nickname = nil
     assert_not @alliancerequest.valid?
   end

   test "clan name should be present" do
     @alliancerequest.clan_name = nil
     assert_not @alliancerequest.valid?
   end

   test "clan members should be present" do
     @alliancerequest.clan_members = nil
     assert_not @alliancerequest.valid?
   end

   test "clan tier should be present" do
     @alliancerequest.clan_tier = nil
     assert_not @alliancerequest.valid?
   end

   test "clan about should be present" do
     @alliancerequest.clan_about = nil
     assert_not @alliancerequest.valid?
   end


   test "order should be most recent first" do
    assert_equal alliancerequests(:most_recent), Alliancerequest.first
  end


end

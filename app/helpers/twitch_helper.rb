module TwitchHelper

  def get_game_name(user_id)
    @client.get_games({id: user_streams(user_id).map(&:game_id)}).data.first.try(:name)
  end

  def user_streams(user_id)
    @streams.select {|i| i.user_id == user_id}
  end

end

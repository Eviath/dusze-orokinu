module TwitchHelper

  def get_game_name(user_id)
    @client.get_games({id: user_streams(user_id).map(&:game_id)}).data.first.try(:name)
  end

  def user_streams(user_id)
    @streams.select {|i| i.user_id == user_id}
  end

  def get_user_stream(user_id)
    @streams.select {|i| i.user_id == user_id}
  end

  def get_user_video(user_id)
    @videos.select {|i| i.user_id == user_id}
  end

  def get_stream_thumbnail(user)
     @thumb = user_streams(user).last.thumbnail_url
     @thumb["{width}"] = "380"
     @thumb["{height}"] = "220"
    return @thumb
  end

  def get_stream_viewer_count(user)
    user_streams(user).last.viewer_count
  end

end

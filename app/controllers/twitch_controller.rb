class TwitchController < ApplicationController
  def index
    require 'twitch-api'
    require 'kappa'

    #  users we want to fetch
    @streamers = Streamer.all
    # client configuration
    @client_id = 'ycitz602bqv6ivmuaafm5ngtr6ad1l'
    @client = Twitch::Client.new client_id: @client_id

    # get users from client
    @user = @client.get_users({login: @streamers.map(&:name)}).data
    @streams = @client.get_streams({user_id: @user.map(&:id)}).data

  end

  def show
  end

end

class TwitchController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :request_access_token unless :check_session

  def index
    require 'twitch-api'
    #  users we want to fetch
    @streamers = Streamer.all

    @client = Twitch::Client.new(access_token: session["access_token"])

    # get users from client
    @user = @client.get_users({login: @streamers.map(&:name)}).data
    @streams = @client.get_streams({user_id: @user.map(&:id)}).data
    @videos = []
    @user.each do |v|
      @user_videos = @client.get_videos({user_id: v.id}).data
      @videos << @user_videos
    end
  end

  def show
  end



  protected

  def check_session
    session['access_token'].nil?
  end

  def request_access_token
    @client_id = ENV['TWITCH_CLIENT_ID']
    @secret_key = ENV['TWITCH_CLIENT_SECRET']
    @redirect_uri = ''
    @url = "https://id.twitch.tv/oauth2/token?client_id=#{@client_id}&client_secret=#{@secret_key}&grant_type=client_credentials"
    @result = HTTParty.post(@url)

    # set access token in cookies
    session['access_token'] = @result['access_token']
  end


end

class StreamersController < ApplicationController
  before_action :find_streamer, only: :show
  before_action :authenticate_user!, except: [:index, :show]
  before_action :request_access_token unless :check_session

  def show
    @client = Twitch::Client.new(access_token: session["access_token"])

    # get users from client
    @user = @client.get_users({login: @streamer.name}).data
    @stream = @client.get_streams({user_id: @user.map(&:id)}).data
  end

  protected

  def find_streamer
    @streamer = Streamer.find(params[:id])
  end

  def check_session
    session['access_token'].nil?
  end

  def request_access_token
    @client_id =  Rails.env.development? ? Rails.application.credentials.TWITCH_CLIENT_ID : ENV['TWITCH_CLIENT_ID']
    @secret_key =  Rails.env.development? ? Rails.application.credentials.TWITCH_CLIENT_SECRET : ENV['TWITCH_CLIENT_SECRET']
    @redirect_uri = ''
    @url = "https://id.twitch.tv/oauth2/token?client_id=#{@client_id}&client_secret=#{@secret_key}&grant_type=client_credentials"
    @result = HTTParty.post(@url)

    # set access token in session
    session['access_token'] = @result['access_token']

  end
end

class StreamersController < ApplicationController
  before_action :find_streamer, only: :show
  before_action :authenticate_user!, except: [:index, :show]
  before_action :request_access_token, if: :check_session

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
    if session['access_token_expiration_date'].nil? || Time.now > session['access_token_expiration_date']
      logger.debug "Access token expired, fetching new access token."
      request_access_token
    else
      logger.debug "Time now is #{Time.now}, Access token valid to #{session['access_token_expiration_date']}"
    end
  end

  def request_access_token
    logger.info "Request access token is run"
    @client_id = ENV['TWITCH_CLIENT_ID'] || Rails.application.credentials.TWITCH_CLIENT_ID
    @secret_key = ENV['TWITCH_CLIENT_SECRET'] || Rails.application.credentials.TWITCH_CLIENT_SECRET
    @url = "https://id.twitch.tv/oauth2/token?client_id=#{@client_id}&client_secret=#{@secret_key}&grant_type=client_credentials"
    @result = HTTParty.post(@url)
    # set access token in cookies
    @expiry = @result['expires_in']
    session['access_token'] = @result['access_token']
    session['access_token_expiration_date'] = Time.now + @expiry/1000.0
    logger.info "Expiration date of access token #{session['access_token_expiration_date']}"
  end
end

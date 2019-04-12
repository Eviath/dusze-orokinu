class AllianceController < ApplicationController
  before_action :get_discord_info, only: [:index, :info]
  before_action :get_clans, only: :index
  before_action :get_abouts, only: [:index, :about]
  before_action :check_session


  def index
    @news = News.includes(:thumbnail_blob).newest.limit(5)

    # show last updated clan
    @last_updated_clan = Clan.approved.newest_updated.limit(1)
    # Newest News
    @newest_news = News.newest.limit(1)
    # Newest Comment
    @newest_comment = Comment.newest.limit(1)
    #  users we want to fetch
    @streamers = Streamer.all
    @client = Twitch::Client.new(access_token: session["access_token"])
    # get users from client
    @user = @client.get_users({login: @streamers.map(&:name)}).data if @streamers.any?
    @streams = @client.get_streams({user_id: @user.map(&:id)}).data unless @client.nil? || @user.nil?


  end

  def about
  end

  def contact
  end

  def rules
    @principles = Principle.all
    @rule_category = RuleCategory.includes(:rule).all
  end

  def info
  end

  private

  def get_clans
    @clans = Clan.approved
  end

  def get_abouts
    @abouts = About.all
  end

  def get_discord_info
    require 'net/http'
    require 'json'
    url = 'https://discordapp.com/api/guilds/144454098748571648/widget.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    @api = JSON.parse(response)

    # Users online discord api
    @api_users =  @api['members']
    # Discord invite link
    @api_invite = @api['instant_invite']
    # Discord server name
    @api_name = @api['name']
  end

protected

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

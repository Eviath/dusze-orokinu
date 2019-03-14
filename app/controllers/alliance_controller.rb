class AllianceController < ApplicationController
  before_action :get_discord_info, only: [:index, :info]
  before_action :get_clans, only: :index
  before_action :get_abouts, only: [:index, :about]


  def index
    @news = News.includes(:thumbnail_blob).newest.limit(5)

    # show last updated clan
    @last_updated_clan = Clan.approved.newest_updated.limit(1)
    # Newest News
    @newest_news = News.newest.limit(1)
    # Newest Comment
    @newest_comment = Comment.newest.limit(1)
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

end

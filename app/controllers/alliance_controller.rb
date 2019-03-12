class AllianceController < ApplicationController
  before_action :get_discord_info, only: [:index, :info]

  def index
    @news = News.includes(:thumbnail_blob).all.limit(5).order('id asc')

    #   abouts
    @main_about = About.where(:assignment => 'MAIN')
    @about_column_two = About.where(:assignment => 'COLUMN_TWO')
    @about_column_one = About.where(:assignment => 'COLUMN_ONE')

    # list all approved clans
    @clans = Clan.approved

    # show last updated clan
    @last_updated_clan = Clan.limit(1).approved.order('updated_at DESC')

    # users online on discord api

    @api_users =  @api['members']
    @api_invite = @api['instant_invite']
    @api_name = @api['name']

    # newest news
    @newest_news = News.limit(1).order('id desc')
    # newest comment
    @newest_comment = Comment.limit(1).order('created_at desc')
  end

  def about
    @main_about = About.where(:assignment => 'MAIN')
    @about_column_two = About.where(:assignment => 'COLUMN_TWO')
    @about_column_one = About.where(:assignment => 'COLUMN_ONE')
  end

  def contact
  end

  def rules
    @principles = Principle.all
    @rule_category = RuleCategory.includes(:rule).all
  end

  def info
    @api_users =  @api['members']
    @api_invite = @api['instant_invite']
    @api_name = @api['name']
  end

  private

  def get_discord_info
    require 'net/http'
    require 'json'
    url = 'https://discordapp.com/api/guilds/144454098748571648/widget.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
    @api = JSON.parse(response)
  end

end

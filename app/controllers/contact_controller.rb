class ContactController < ApplicationController

  def index


    require 'net/http'
    require 'json'

    url = 'https://discordapp.com/api/guilds/144454098748571648/widget.json'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)

    api = JSON.parse(response)

    @api_channels = api['channels']
    @api_users =  api['members']
    @api_invite = api['instant_invite']
    @api_name = api['name']

  end

end

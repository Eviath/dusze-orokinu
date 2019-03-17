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

    evid =  @api_users.find {|x| x['id'] == "259360162739912707"}
    pimatron =  @api_users.find {|x| x['id'] == "267400113264001034"}
    @admins = []
    @admins << evid; pimatron


  end

end

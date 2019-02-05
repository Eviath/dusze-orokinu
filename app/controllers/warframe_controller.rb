class WarframeController < ApplicationController

  def poe
  end

  def newsfeed
  end

  def missions

    require 'net/http'
    require 'json'

    url = 'https://api.warframestat.us/pc'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)

    api = JSON.parse(response)

    @sortie = api['sortie']

    @alerts = api['alerts']
  end



  def wfdrop
  end

end

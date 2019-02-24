class WarframeController < ApplicationController
  after_action :cors_set_access_control_headers

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
  end

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

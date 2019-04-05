class StreamersController < ApplicationController
  before_action :find_streamer, only: :show

  def show

    # client configuration
    @client_id = 'ycitz602bqv6ivmuaafm5ngtr6ad1l'
    @client = Twitch::Client.new client_id: @client_id

    # get users from client
    @user = @client.get_users({login: @streamer.name}).data
    @stream = @client.get_streams({user_id: @user.map(&:id)}).data

  end

  protected

  def find_streamer
    @streamer = Streamer.find(params[:id])
  end
end

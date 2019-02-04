class AllianceController < ApplicationController
  def index
    @news = News.limit(5).order('id desc')
  end

  def warframe
  end

  def contact
  end

  def clans
  end

  def info
  end
end

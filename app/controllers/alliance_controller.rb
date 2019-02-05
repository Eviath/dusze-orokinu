class AllianceController < ApplicationController
  def index
    @news = News.limit(5).order('id desc')

    #   abouts
    @main_about = About.where(:assignment => 'MAIN')
    @about_column_two = About.where(:assignment => 'COLUMN_TWO')
    @about_column_one = About.where(:assignment => 'COLUMN_ONE')
  end

  def about
    #   abouts
    @main_about = About.where(:assignment => 'MAIN')
    @about_column_two = About.where(:assignment => 'COLUMN_TWO')
    @about_column_one = About.where(:assignment => 'COLUMN_ONE')
  end

  def contact
  end

  def rules
    @rules = Rule.all
  end

  def info
  end
end

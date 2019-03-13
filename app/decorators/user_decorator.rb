class UserDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def last_seen
     unless object.last_seen.blank?
        content_tag(:span, "#{last_seen_at}")
     end
  end

  def active_at
    unless object.last_seen.blank?
      content_tag( :p,"(Online #{last_seen_at_words} temu)", class:'active')
    end
  end

  def message_user
    link_to 'Napisz', new_message_path(to: object), class: 'btn btn-do-vitru' if current_user != object
  end


  #
  # == Method/Helpers for Decorator
  #

  def created_at
    content_tag(:span, "#{object.created_at.strftime("%F %T")}")
  end

  def last_seen_at
    object.last_seen.strftime("%F %T")
  end

  def last_seen_at_words
    time_ago_in_words(object.last_seen)
  end


end
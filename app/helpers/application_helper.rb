module ApplicationHelper

  # return image with proper style and classes
  def styled_image(image, classes = '')
    # determine style of image
    if cookies[:layout] == 'vitruvian'
      style = cookies[:layout]
      image_tag(asset_pack_path("media/images/#{style}/#{image}"), class:"#{classes}")
    else
      style = 'ghostie'
      image_tag(asset_pack_path("media/images/#{style}/#{image}"), class:"#{classes}")
    end
  end

  # return proper logo depending on chosen style
  def application_logo(classes)
    if cookies[:layout] == 'application' || cookies[:layout].nil?
      image_tag(asset_pack_path('media/images/duszek-awesome.svg'), class:"#{classes}")
    else
      image_tag(asset_pack_path('media/images/duszki.png'), class:"#{classes}")
    end
  end

  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options)
    link_to(name, options, html_options, &block)
  end

  def page_header(text)
    content_for(:page_header) { text.to_s }
  end


  def markdown(content)
    markdown =Redcarpet::Markdown.new(Redcarpet::Render::XHTML,:hard_wrap=>true,:filter_html=>true,:autolink=>true,:no_intra_emphasis=>true)
    markdown.render(content).html_safe
  end

def trix 
  var element = document.querySelector("trix-editor")
element.editor
end


  def user_avatar(user, size=120)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      asset_pack_path('media/images/vitru-glyph.png')
    end
  end




  # check for new alliance requests since last user login
  def new_requests_since_last_login(user)
    now = Time.now

    if !user.last_sign_in_at.blank?
    user_last_login = user.last_sign_in_at.to_datetime
    else
    user_last_login = Time.now.to_datetime
    end

    Request.pending.where(updated_at: (user_last_login)..now).count
  end

  # check for new news since last user login
  def object_created_at_timestamp_in_days(news, time)
    news.created_at > time.days.ago
  end

end

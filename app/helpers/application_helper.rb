module ApplicationHelper

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


  def is_lider
    @user.has_role? :lider
  end


  def user_avatar(user, size=120)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end

end

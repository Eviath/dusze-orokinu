class RequestDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  delegate :current_page, :total_pages, :limit_value
  decorates :request

  # Request show actions
  def actions
    if can?(:destroy, object)
      concat(link_to "Usuń", request_path(request), method: :delete, data: { 'confirm-swal': "Jesteś pewny?" }, :class => "btn btn-do-main")
    end
    if can?(:manage, object)
      h.capture do
        if object.approval? || object.approval.nil?
          concat(link_to "Odrzuć", decline_request_path(request), :class => "btn btn-do-main")
        end
        unless request.approval?
          concat(link_to "Zatwierdź", approve_request_path(request), :class => "btn btn-do-main")
        end
       unless request.approval.nil?
         concat(link_to "Dodaj do oczekujących", pend_request_path(request), :class => "btn btn-do-main")
       end
      end
      end
  end

  # Requests index approval status
  def approval_status
    if object.approval
      "Zaakceptowane"
    elsif object.approval == nil
      "Oczekujące"
    else
      "Odrzucone"
    end
  end

  # Request status panel
  def status
    content_tag(:div, class:'clan_show_content-wrapper') do
      content_tag(:div, class:'jumbotron') do
        concat(content_tag(:h1, "#{'Witaj ' + current_user.name + '!'}", class:'display-4'))
        concat(content_tag(:p, "Stan Twojego podania do sojuszu.", class:'lead'))
        concat(content_tag(:hr, nil, class:'my-4'))
        concat(content_tag(:p, "Wygląda na to, że Twoje podanie nie zostało jeszcze rozpatrzone, lub zostało odrzucone! O decyzji zostaniesz powiadomiony/a na adres e-mail podany przy rejestracji."))
        concat(content_tag(:div, class:'request-button') do
          link_to "Sprawdź podanie do sojuszu", '/podanie', class: "btn btn-do-main"
        end)
      end
    end
  end

end

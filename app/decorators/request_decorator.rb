class RequestDecorator < Draper::Decorator
  delegate_all
  include Draper::LazyHelpers
  delegate :current_page, :total_pages, :limit_value
  decorates :request

  # Request show actions
  def actions
    if can?(:destroy, object)
      concat(link_to "Usuń", request_path(request), method: :delete, data: { 'confirm-swal': "Jesteś pewny?" }, :class => "btn btn-do-vitru")
    end
    if can?(:manage, object)
      h.capture do
        if object.approval? || object.approval.nil?
          concat(link_to "Odrzuć", decline_request_path(request), :class => "btn btn-do-vitru")
        end
        unless request.approval?
          concat(link_to "Zatwierdź", approve_request_path(request), :class => "btn btn-do-vitru")
        end
       unless request.approval.nil?
         concat(link_to "Dodaj do oczekujących", pend_request_path(request), :class => "btn btn-do-vitru")
       end
      end
      end
  end

  def request_show
    content_tag(:div, class:'clan-approval-pending') do
      content_tag(:div, class: 'row') do
        content_tag(:div, class:'col-md-4 mx-auto text-center') do
          content_tag(:h2, "Podania zaakceptowane.")
        end
      end
      h.content_tag(:div, class: 'row') do
          render 'single_request', :request => object
      end
    end
  end

  def request_nothing
    content_tag(:div, class: 'row') do
      content_tag(:div, class:'col-md-8 mx-auto text-center') do
        content_tag(:h4, "Nie ma żadnych podań przyjętych do sojuszu!")
      end
    end
  end


  def approval_status
    if object.approval
      "Zaakceptowane"
    elsif object.approval == nil
      "Oczekujące"
    else
      "Odrzucone"
    end

  end




  end

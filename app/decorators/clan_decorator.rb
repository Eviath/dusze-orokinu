class ClanDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all
  decorates :clan

  # Return recruitment status in div with string
  def recruitment_status
    if object.recruitment_status
      content_tag(:div, "Rekrutacja otwarta", class:'clan-recruitment-open')
    else
      content_tag(:div, "Rekrutacja zamknięta", class:'clan-recruitment-close')
    end
  end


  # Clan index actions
  def actions
    concat(link_to 'Zobacz', object, class: "btn btn-do-vitru") if current_page?(action: 'index')
    if can?(:manage, object)
      h.capture do
        concat " | " if current_page?(action: 'index')
        concat(link_to "Edytuj", edit_clan_path(object), class: "btn btn-do-vitru", data: { turbolinks: false })
        concat " | "
        concat(link_to "Usuń", object, method: :delete, data: { 'confirm-swal': "Jesteś pewny, że chcesz to usunąć?" }, class: "btn btn-do-vitru")
      end
    end
  end


  # Approve clan action
  def approval
    if has_role?(:admin)
      content_tag(:div, class:'clan_actions p-2 text-center mt-4') do
        if object.approval
          link_to (object.approval ? "Odrzuć" : "Zatwierdź"), decline_clan_path(object) , class: 'btn btn-do-vitru'
        else
          link_to (object.approval ? "Odrzuć" : "Zatwierdź"), approve_clan_path(object) , class: 'btn btn-do-vitru'
        end
      end
    end
  end

  # Clan show actions for clan info
  def discord_link
    unless object.discord.empty?
      link_to "Discord", object.discord, target: '_blank', class: "btn btn-do-bordered-square btn-clan"
    end
  end

  def website_link
    unless object.website.empty?
      link_to "Strona internetowa", object.website, target: '_blank', class: "btn btn-do-bordered-square btn-clan"
    end
  end

  def lider_msg_link
    link_to 'Napisz do lidera', new_message_path(to: object.user), class: 'btn btn-do-bordered-square btn-clan'
  end




#
# == Clan panel
#

  def clan_approval
    if object
      content_tag(:div, class:'clan_show_content-wrapper') do
        content_tag(:div, class:'jumbotron') do
          concat(content_tag(:h1, "#{approval_header}", class:'display-4'))
          concat(content_tag(:hr, nil, class:"my-4 "))
          concat(content_tag(:p, "#{approval_description}"))
          content_tag(:div,  class:'request-button') do
            link_to_clan_list if pending
          end
        end
      end
    end
  end

  # Approval status
  def approved
    object.approval?
  end
  def pending
    object.approval.nil?
  end
  def declined
    !object.approval?
  end

  # Header for clan approval
  def approval_header
    if approved
      "Ogłoszenie zostało zaakceptowane"
    elsif pending
      "Stworzyłeś ogłoszenie swojego klanu!"
    elsif declined
      "Ogłoszenie Twojego klanu zostało odrzucone."
    end
  end

  # Description for clan approval
  def approval_description
    if approved
      "Możesz je edytować poniżej ile dusza zapragnie, edycja nie musi zostać zatwierdzona przez administrację, pamiętaj jednak, że jeśli w ogłoszeniu pojawią się treści łamiące regulamin strony, ogłoszenie zostanie wyrzucone."
    elsif pending
      "Ogłoszenie pojawi się na liście klanów, gdy zostanie zaakceptowane przez administrację sojuszu."
    elsif declined
      "Popraw ogłoszenie tak, by było zgodne z regulaminem i zgłoś się do Administracji o ponowne rozpatrzenie ogłoszenia."
    end
  end

  # Link to clans page for clan approval
  def link_to_clan_list
    link_to "Lista klanów", clans_path, class: "btn btn-do-vitru"
  end



end

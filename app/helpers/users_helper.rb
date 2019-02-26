module UsersHelper

  # user roles in buttons
  def user_ranks(user)

    # check if user have created clan
    check_if_clan_present = user.clan.present? ? user.clan.name : '';

    # lider przycisk
    lider_button = link_to user.clan, class:'btn btn-do-profile' do
                      content_tag :span, "Lider klanu #{check_if_clan_present}", :class => "link-vitruvian-light"
                    end

    # moderator przycisk
    moderator_button = content_tag(:button, content_tag(:span, "Moderator"), class: "btn btn-do-profile disabled")

    # administrator przycisk
    admin_button = content_tag(:button, content_tag(:span, "Administrator"), class: "btn btn-do-profile disabled")

    # użytkownik przycisk
    user_button = content_tag(:button, content_tag(:span, "Użytkownik"), class: "btn btn-do-profile disabled")

    # if statement render buttons depending on user roles
    if user.has_role?(:admin) && user.has_role?(:lider)
      content_tag :div do

        concat admin_button
        concat " "
        concat lider_button
      end
    elsif user.has_role?(:moderator) && user.has_role?(:lider)
      content_tag :div do

        concat moderator_button
        concat " "
        concat lider_button
      end

    elsif user.has_role?(:admin)
      admin_button

    elsif user.has_role?(:moderator)
      moderator_button

    elsif user.has_role?(:lider)
      lider_button

    else
      user_button

    end
  end



  # user role in simple string
  def user_role(user)

  if user.has_role?(:admin)
    "Administrator"
  elsif user.has_role?(:moderator)
    "Moderator"
  elsif user.has_role?(:lider)
    "Lider klanu"
  else
    "Użytkownik"
  end

  end



end

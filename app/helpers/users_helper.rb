module UsersHelper




  def user_ranks(user)

    # check if user have created clan
    check_if_clan_present = user.clan.present? ? user.clan.name : '';

    # rangi
    admin = user.has_role? :admin
    lider = user.has_role? :lider

    # lider przycisk
    lider_button = link_to user.clan, class:'btn btn-do-profile' do
                      content_tag :span, "Lider klanu #{check_if_clan_present}", :class => "link-vitruvian-light"
                    end

    # administrator przycisk
    admin_button = content_tag(:button, content_tag(:span, "Administrator"), class: "btn btn-do-profile disabled")

    # użytkownik przycisk
    user_button = content_tag(:button, content_tag(:span, "Użytkownik"), class: "btn btn-do-profile disabled")


    # if statement render buttons depending on user roles
    if admin && lider
      content_tag :div do

        concat admin_button
        concat " "
        concat lider_button
      end

    elsif admin
      content_tag(:button, content_tag(:span, "Administrator"), class: "btn btn-do-profile disabled")


    elsif lider
      lider_button

    else
      user_button

    end


  end   #end user ranks










# end helper
end

module ClansHelper


  def clans_with_status(objects, status)
    if objects.any?
      partials = []
        objects.each do |clan|
          partials << render(partial: "single_clan_index", locals: { clan: clan })
        end
    if can?(:manage, Clan)
      concat(content_tag(:h2, "#{status_header(status)}", class:'text-center p-5'))
    end
    content_tag(:div, class:"row clans_row") do
      concat(safe_join partials)
    end
    else
      content_tag(:div, class:"row") do
        content_tag(:div, class:"col-md-8 mx-auto text-center") do
          content_tag(:h4) do
            status_string(status)
          end
        end
      end
    end
  end


  def status_header(status)
    if status == "approved"
      "Zaakceptowane klany"
    elsif status == "declined"
      "Odrzucone klany"
    elsif status == "pending"
      "Oczekujące klany"
    end
  end

  def status_string(status)
    if status == "approved"
      "Brak klanów do wyświetlenia"
    elsif status == "pending"
      "Brak klanów oczekujących na akceptację"
    elsif status == "declined"
      "Brak odrzuconych klanów"
    end
  end

end

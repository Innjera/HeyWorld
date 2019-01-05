module TenderStatusHelper

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def tender_status_text(tender)
    if tender.starts_at < T1 && tender.ends_at > T1
      content_tag(:span, class:"text-danger") do
        content_tag(:strong, "in progress")
      end
    elsif tender.starts_at > T1
      content_tag(:span, class:"text-primary") do
        content_tag(:strong, "coming")
      end
    elsif tender.ends_at < T1
      content_tag(:span, class:"text-muted") do
        content_tag(:strong, "finished")
      end
    end
  end

end

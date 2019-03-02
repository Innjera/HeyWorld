module TenderStatusHelper

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def tender_status_text(tender)
    ### 0(draft)
    if tender.preparation_status == 0
      ### before tender
      if tender.tender_status == 0
        content_tag(:span, class:"text-danger", style:"font-size:1rem;") do
          t('tenders.draft_text')
        end
      ### tender ongoing or finished though tender is draft
      elsif tender.tender_status == 1 || 2
        content_tag(:span, class:"badge badge-pill badge-warning py-1", style:"font-size:1rem;") do
          content_tag(:i, class: "fas fa-exclamation-triangle") do
            t('tenders.warn_text')
          end
        end
      end
    ### 1(ready)
    elsif tender.preparation_status == 1
      ### before_tender
      if tender.tender_status == 0
        content_tag(:span, class:"text-success", style:"font-size:1rem;") do
          t("tenders.ready_text")
        end
      ### tender ongoing
    elsif tender.tender_status == 1
      content_tag(:span, class:"text-primary", style:"font-size:1rem;") do
        t('tenders.in_progress')
      end
    elsif tender.tender_status == 2
      content_tag(:span, class:"text-secondary", style:"font-size:1rem;") do
        t('tenders.completed')
      end
    end
  end ### if
  end ### def

  def tender_status_text_for_c(tender)
    ### 0(draft)
    if tender.preparation_status == 0
      ### before tender
      if tender.tender_status == 0
        content_tag(:span, class:"text-danger", style:"font-size:1rem;") do
          t('tenders.draft_text')
        end
      ### tender ongoing or finished though tender is draft
      elsif tender.tender_status == 1 || 2
        content_tag(:span, class:"badge badge-pill badge-warning py-1", style:"font-size:1rem;") do
          content_tag(:i, class: "fas fa-exclamation-triangle") do
            t('tenders.warn_text')
          end
        end
      end
    ### 1(ready)
    elsif tender.preparation_status == 1
      ### before_tender
      if tender.tender_status == 0
        content_tag(:span, class:"text-success", style:"font-size:1rem;") do
          t("tenders.ready_text_for_c")
        end
      ### tender ongoing
    elsif tender.tender_status == 1
      content_tag(:span, class:"text-primary", style:"font-size:1rem;") do
        t('tenders.in_progress')
      end
    elsif tender.tender_status == 2
      content_tag(:span, class:"text-secondary", style:"font-size:1rem;") do
        t('tenders.completed')
      end
    end
  end ### if
  end ### def

end

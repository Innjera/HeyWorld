module TenderStatusHelper

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def tender_status_text(tender)
    ### 0(ドラフト)
    if tender.status == 0
      ### 現在より入札開始日が未来
      if T1 < tender.starts_at
        content_tag(:span, class:"text-danger", style:"font-size:1rem;") do
          t('tenders.draft_text')
        end
        ### 入札開始予定日を過ぎているのにまだステータスがドラフトの場合
      elsif tender.starts_at < T1
        content_tag(:span, class:"badge badge-pill badge-warning py-1", style:"font-size:1rem;") do
          content_tag(:i, class: "fas fa-exclamation-triangle") do
            t('tenders.warn_text')
          end
        end
      end
    ### 1(準備完了)
    elsif tender.status == 1
      ### 現在より入札開始日が未来
      if T1 < tender.starts_at
        content_tag(:span, class:"text-success", style:"font-size:1rem;") do
          t("tenders.ready_text")
        end
    ### 入札中
    elsif tender.starts_at < T1 && T1 < tender.ends_at
      content_tag(:span, class:"text-primary", style:"font-size:1rem;") do
        t('tenders.in_progress')
      end
    elsif tender.ends_at < T1
      content_tag(:span, class:"text-secondary", style:"font-size:1rem;") do
        t('tenders.completed')
      end
    end
  end ### if
  end ### def

end

module TenderStatusHelper

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def tender_status_text(tender)
    ### 0(ドラフト)
    if tender.status == 0
      ### 現在より入札開始日が未来
      if T1 < tender.starts_at
        content_tag(:span, class:"badge badge-pill badge-primary py-1", style:"font-size:0.8rem;") do
          content_tag(:strong, t('tenders.draft_text'))
        end
      ### 入札開始予定日を過ぎているのにまだステータスがドラフトの場合
      elsif tender.starts_at < T1
        content_tag(:span, class:"badge badge-pill badge-warning py-1", style:"font-size:0.8rem;") do
          content_tag(:i, class: "fas fa-exclamation-triangle") do
            content_tag(:strong, t('tenders.warn_text'))
          end
        end
      end
    ### 1(準備完了)
    elsif tender.status == 1
      ### 現在より入札開始日が未来
      if T1 < tender.starts_at
        content_tag(:span, class:"text-success") do
          content_tag(:strong, "ready_text")
        end
    ### 入札中
    elsif tender.starts_at < T1 && T1 < tender.ends_at
      content_tag(:span, class:"badge badge-pill badge-danger py-1", style:"font-size:0.8rem;") do
        content_tag(:strong, t('tenders.in_progress'))
      end
    elsif tender.ends_at < T1
      content_tag(:span, class:"badge badge-pill badge-secondary py-1", style:"font-size:0.8rem;") do
        content_tag(:strong, t('tenders.completed'))
      end
    end
  end ### if
  end ### def

end

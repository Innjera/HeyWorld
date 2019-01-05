module TenderStatus

  T0 = Time.current.beginning_of_day
  T1 = Time.current
  T2 = T0.advance(hours: 24)

  def tender_status_text(tender)
    if tender.starts_at < T1 && tender.ends_at > T1
      "in progress"
    end
  end

end

module TenderHelper
  def format_wday_ja(datetime)
    %w(日 月 火 水 木 金 土)[datetime.wday]
  end

  def format_wday_en(datetime)
    %w(Sun Mon Tue Wed Thu Fru Sat)[datetime.wday]
  end
end

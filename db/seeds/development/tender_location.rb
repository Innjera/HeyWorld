company_names = [
  "株式会社コマゼン",
  "株式会社ユーパーツ",
  "株式会社エコアール",
  "株式会社吉田商会"
]

address_prefecture_parts = [
  "Aichi",
  "Saitama",
  "Osaka",
  "Kanagawa"
]

address_city_parts = [
  "Nagoya",
  "Yokohama",
  "Osaka",
  "Yatomi"
]

address_rest_parts = [
  "Kusunoki 1-26-2",
  "Sayada 1285-2",
  "Kubotacho 838-1",
  "Shimojimachi 29"
]

company_names.each do |seller|
  seller = Seller.find_by(company_name: seller)
  0.upto(1) do |idx|
    TenderLocation.create!(
      seller: seller,
      address_prefecture_part: address_prefecture_parts.sample,
      address_city_part: address_city_parts.sample,
      address_rest_part: address_rest_parts.sample
    )
  end
end

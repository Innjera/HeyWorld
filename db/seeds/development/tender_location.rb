seller1 = Seller.find_by(company_name: "株式会社コマゼン")
TenderLocation.create!(
  seller: seller1,
  address_prefecture_part: "Aichi",
  address_city_part: "Yatomi",
  address_rest_part: "Kusunoki, 1-26-2"
)
TenderLocation.create!(
  seller: seller1,
  address_prefecture_part: "Tokyo(TEST1)",
  address_city_part: "Minatoku(TEST1)",
  address_rest_part: "Roppongi(TEST1) 1-2-3"
)


seller2 = Seller.find_by(company_name: "株式会社ユーパーツ")
TenderLocation.create!(
  seller: seller2,
  address_prefecture_part: "Saitama",
  address_city_part: "Kumagaya",
  address_rest_part: "Sayada 1285-2"
)
TenderLocation.create!(
  seller: seller2,
  address_prefecture_part: "Tokyo(TEST2)",
  address_city_part: "Minatoku(TEST2)",
  address_rest_part: "Roppongi(TEST2) 4-5-6"
)

seller3 = Seller.find_by(company_name: "株式会社吉田商会")
TenderLocation.create!(
  seller: seller3,
  address_prefecture_part: "Aichi",
  address_city_part: "Toyohashi",
  address_rest_part: "Shimojimachi 29"
)
TenderLocation.create!(
  seller: seller3,
  address_prefecture_part: "Tokyo(TEST3)",
  address_city_part: "Minatoku(TEST3)",
  address_rest_part: "Roppongi(TEST3) 7-8-9"
)

seller4 = Seller.find_by(company_name: "株式会社エコアール")
TenderLocation.create!(
  seller: seller4,
  address_prefecture_part: "Tochigi",
  address_city_part: "Ashikaga",
  address_rest_part: "Kubotacho 838-1"
)
TenderLocation.create!(
  seller: seller4,
  address_prefecture_part: "Tokyo(TEST4)",
  address_city_part: "Minatoku(TEST4)",
  address_rest_part: "Roppongi(TEST4) 10-11-12"
)

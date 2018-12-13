company_names = [
  "株式会社コマゼン",
  "株式会社ユーパーツ",
  "株式会社エコアール",
  "株式会社吉田商会"
]

company_names_en = [
  "Komazen",
  "U-parts",
  "Eco-R",
  "Yoshida Shokai"
]
company_addresses = [
  "愛知県弥冨市 楠1-26-2",
  "埼玉県熊谷市佐谷田1285-2",
  "栃木県足利市久保田町838-1",
  "愛知県豊橋市下地町字新道29番地"
]
company_urls = [
  "http://www.komazen.co.jp/",
  "https://www.u-parts.com/",
  "http://www.eco-r.jp/",
  "https://www.yoshida-shoukai.com/"
]

company_tells = [
  "0280571258",
  "0332852097",
  "0718816614",
  "0532533907"
]

emails = [
  "komazen",
  "uparts",
  "ecor",
  "yoshida"
]

0.upto(3) do |idx|
  Seller.create(
    company_name: "#{company_names[idx % 4]}",
    company_name_en: "#{company_names_en[idx % 4]}",
    company_address: "#{company_addresses[idx % 4]}",
    company_url: "#{company_urls[idx % 4]}",
    company_tell: "#{company_tells[idx % 4]}",
    email: "#{emails[idx % 4]}@heyworld.com",
    password: "heyworld"
  )
end

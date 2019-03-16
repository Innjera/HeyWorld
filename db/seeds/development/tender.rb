datetime0 = Time.current.beginning_of_day

## 終了
#### id:1
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社コマゼン"),
  tender_location: TenderLocation.where(seller_id: 1).sample,
  starts_at: datetime0.advance(days: -10, hours: 9),
  ends_at: datetime0.advance(days: -3, hours: 15),
  preparation_status: 1
)

#### id:2
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社ユーパーツ"),
  tender_location: TenderLocation.where(seller_id: 2).sample,
  starts_at: datetime0.advance(days: -10, hours: 7),
  ends_at: datetime0.advance(days: -1, hours: 7),
  preparation_status: 1
)

#### id:3
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社エコアール"),
  tender_location: TenderLocation.where(seller_id: 3).sample,
  starts_at: datetime0.advance(days: -11, hours: 7),
  ends_at: datetime0.advance(days: -8, hours: 7),
  preparation_status: 1
)

## 開催中（但しエラー発生中）
#### id:4
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社コマゼン"),
  tender_location: TenderLocation.where(seller_id: 1).sample,
  starts_at: datetime0.advance(days: -2, hours: 9),
  ends_at: datetime0.advance(days: +2, hours: 12),
  preparation_status: 0
)

## 開催中
#### id:5
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社コマゼン"),
  tender_location: TenderLocation.where(seller_id: 1).sample,
  starts_at: datetime0.advance(days: -1, hours: 9),
  ends_at: datetime0.advance(days: +3, hours: 12),
  preparation_status: 1
)

#### id:6
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社ユーパーツ"),
  tender_location: TenderLocation.where(seller_id: 2).sample,
  starts_at: datetime0.advance(days: -2, hours: 7),
  ends_at: datetime0.advance(days: +2, hours: 7),
  preparation_status: 1
)

#### id:7
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社エコアール"),
  tender_location: TenderLocation.where(seller_id: 3).sample,
  starts_at: datetime0.advance(days: -3, hours: 7),
  ends_at: datetime0.advance(days: +1, hours: 7),
  preparation_status: 1
)

## 開催前
#### id:8
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社コマゼン"),
  tender_location: TenderLocation.where(seller_id: 1).sample,
  starts_at: datetime0.advance(days: +4, hours: 9),
  ends_at: datetime0.advance(days: +7, hours: 12),
  preparation_status: 0
)

#### id:9
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社コマゼン"),
  tender_location: TenderLocation.where(seller_id: 1).sample,
  starts_at: datetime0.advance(days: +5, hours: 9),
  ends_at: datetime0.advance(days: +8, hours: 12),
  preparation_status: 1
)

#### id:10
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社ユーパーツ"),
  tender_location: TenderLocation.where(seller_id: 2).sample,
  starts_at: datetime0.advance(days: +4, hours: 7),
  ends_at: datetime0.advance(days: +8, hours: 7),
  preparation_status: 0
)

#### id:11
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社ユーパーツ"),
  tender_location: TenderLocation.where(seller_id: 2).sample,
  starts_at: datetime0.advance(days: +5, hours: 7),
  ends_at: datetime0.advance(days: +6, hours: 7),
  preparation_status: 1
)

#### id:12
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社エコアール"),
  tender_location: TenderLocation.where(seller_id: 3).sample,
  starts_at: datetime0.advance(days: +10, hours: 7),
  ends_at: datetime0.advance(days: +12, hours: 7),
  preparation_status: 0
)

#### id:13
Tender.create!(
  seller: Seller.find_by(company_name: "株式会社エコアール"),
  tender_location: TenderLocation.where(seller_id: 3).sample,
  starts_at: datetime0.advance(days: +4, hours: 7),
  ends_at: datetime0.advance(days: +6, hours: 7),
  preparation_status: 1
)

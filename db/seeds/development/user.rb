first_names = [
  "Erika",
  "Maki"
]

last_names = [
  "Sagawa",
  "Chimura"
]

emails = [
  "erika@heyworld.com",
  "maki@heyworld.com"
]

0.upto(1) do |idx|
  User.create!(
    first_name: "#{first_names[idx % 2]}",
    last_name: "#{last_names[idx % 2]}",
    email: "#{emails[idx % 2]}",
    password: "heyworld"
  )
end

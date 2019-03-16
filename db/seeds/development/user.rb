first_names = [
  "Erika",
  "Maki",
  "Dummy1",
  "Dummy2"
]

last_names = [
  "Sagawa",
  "Chimura",
  "Dummy1",
  "Dummy2"
]

emails = [
  "erika@heyworld.com",
  "maki@heyworld.com",
  "dummy1@heyworld.com",
  "dummy2@heyworld.com"
]

0.upto(3) do |idx|
  User.create!(
    first_name: "#{first_names[idx % 4]}",
    last_name: "#{last_names[idx % 4]}",
    email: "#{emails[idx % 4]}",
    password: "heyworld"
  )
end

# names = ['John', 'three police officers']
# addresses = [
#   "214-180 Bryanston Dr, Bryanston, Sandton, 2191",
#   "80-70 Marcia St Cyrildene, Johannesburg, 2026"
# ]
# bribe = [800, 0]
# situations = [
#   'I was out for dinner with my wife and a daughter, and unfortunately left my Passport in my home. After the dinner and on the way back, the police put a checkpoint at Bryanston and they stopped us. Obviously, the police officer ordered me to show the ID and I did not. He ordered me to get off my car and he showed me "handcuff" and "threatened" me. The police said many times that "I am gonna arrest you and you gonna sleep at the police station." My leg was shaking, I was confused and could not remain calm because my wife was scared and my daughter was crying.. finally, the office asked me "how much do you have?" I paid him 800 rand and he released me. handcuff was too much! i just forgot bringing my ID!!',
#   "When we drove around Bruma, a police car approached my car from the behind and stopped us. Three police officers approached, I did nothing wrong and showed them my ID and License. Friend of mine sitting in the front was not with his ID. The officers took this chance and told us that the police would take hime to police station and I need to bring his ID. I said “OK, we will do so.” I do not know why, but they repeatedly told us that it will take at least 4 hours to release the friend of mine for the paper work in police station. I said “no way, as soon as I bring the ID you will release him.” Maybe they were waiting for our offer of bribe. But we did not. Eventually, the police took my friend into the police car and when I got my car started, suddenly police released my friend from the police car and we were allowed to go. What a waste of time..."
# ]
#
# dates = ["2018-03-20 20:00:00", "2018-04-25 19:30:00"]
#
# 0.upto(1) do |idx|
#   Note.create(
#     policeofficer_name: "#{names[idx % 2]}",
#     address_city_part:  "#{addresses[idx % 2]}",
#     bribe: "#{bribe[idx % 2]}",
#     situation: "#{situations[idx % 2]}",
#     occured_at: "#{dates[idx % 2]}"
#   )
# end

require "open-uri"

Request.destroy_all
Payment.destroy_all
Expense.destroy_all
Budget.destroy_all
Property.destroy_all
Owner.destroy_all
Syndic.destroy_all
User.destroy_all
Coproperty.destroy_all

# User - Syndic
user_syndic1 = User.create!(email: "test1@gmail.com", password: "123456", role: "Syndic", admin: false)
puts 'User syndic 1 created'

# User - Owners
user_owner1 = User.create!(email: "test3@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 1 created'

user_owner2 = User.create!(email: "test4@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 2 created'

user_owner3 = User.create!(email: "test5@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 3 created'

user_owner4 = User.create!(email: "test6@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 4 created'

user_owner5 = User.create!(email: "test7@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 5 created'

user_owner6 = User.create!(email: "test8@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 6 created'

user_owner7 = User.create!(email: "test9@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 7 created'

user_owner8 = User.create!(email: "test10@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 8 created'

user_owner9 = User.create!(email: "test11@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 9 created'

user_owner10 = User.create!(email: "test12@gmail.com", password: "123456", role: "Owner", admin: false)
puts 'User owner 10 created'

# User - Admin
user_admin1 = User.create!(email: "testadmin@gmail.com", password: "admin1234556686", admin: true)
puts 'Admin 1 created'

# Syndic - Prosyndic
syndic_1 = Syndic.create!(syndic_name: "Prosyndic", creation_date: "2008-01-01", user: user_syndic1)
puts 'Prosyndic created'

# Owners - Résidence le Rossignol
owner_1 = Owner.create!(first_name: "Jihane", last_name: "El Jbari", gender: "Femme", card_number: "CD567833", phone_number: "+212618335908", ownership_date: "2022-10-15", birth_date: "1994-04-11", user: user_owner1)
owner_2 = Owner.create!(first_name: "Amal", last_name: "Loudiyi", gender: "Femme", card_number: "KS567844", phone_number: "+212612783321", ownership_date: "2022-01-22", birth_date: "1995-08-22", user: user_owner2)
owner_3 = Owner.create!(first_name: "Yassine", last_name: "Ambari", gender: "Homme", card_number: "DE567822", phone_number: "+212619557766", ownership_date: "2021-12-02", birth_date: "1987-03-01", user: user_owner3)
owner_4 = Owner.create!(first_name: "Houssam", last_name: "Chakir", gender: "Homme", card_number: "CL567866", phone_number: "+212645113488", ownership_date: "2021-11-15", birth_date: "1984-10-04", user: user_owner4)
owner_5 = Owner.create!(first_name: "Zakarya", last_name: "Karti", gender: "Homme", card_number: "CM5677334", phone_number: "+212611225678", ownership_date: "2021-11-15", birth_date: "1993-05-25", user: user_owner5)
owner_6 = Owner.create!(first_name: "Omar", last_name: "Kazeb", gender: "Homme", card_number: "CD876654", phone_number: "+212667113488", ownership_date: "2021-11-15", birth_date: "1970-01-28", user: user_owner6)
owner_7 = Owner.create!(first_name: "Bachir", last_name: "Cherrat", gender: "Homme", card_number: "SZ5224567", phone_number: "+212643113488", ownership_date: "2021-11-15", birth_date: "1985-02-09", user: user_owner7)
owner_8 = Owner.create!(first_name: "Alex", last_name: "Codiepie", gender: "Homme", card_number: "KL567866", phone_number: "+212654338722", ownership_date: "2021-11-15", birth_date: "1992-01-23", user: user_owner8)
owner_9 = Owner.create!(first_name: "Mohammed", last_name: "Machkour", gender: "Homme", card_number: "MO335123", phone_number: "+2127992381", ownership_date: "2021-11-15", birth_date: "1977-10-09", user: user_owner9)
owner_10 = Owner.create!(first_name: "Lina", last_name: "Moussalim", gender: "Femme", card_number: "CE785543", phone_number: "+212678995451", ownership_date: "2021-11-15", birth_date: "1969-03-11", user: user_owner10)

# Coproperties - Prosyndic
puts 'Creating coproperties'
file_1 = URI.open("https://images.unsplash.com/photo-1597047084897-51e81819a499?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80")
coproperty_1 = Coproperty.new(coproperty_name: "Résidence Le Rossignol", number_properties: 10, address: "11, boulevard Roudani, Casablanca", expense_method: "Fixe par Habitant", coprop_private_area: 1018, coprop_common_area: 500, bank_account: "123456", building_type: "Bâtiment Unique",syndic: syndic_1)
coproperty_1.photo.attach(io: file_1, filename: "rossignol.jpg", content_type: "image/jpg")
coproperty_1.save
file_2 = URI.open("https://images.trvl-media.com/lodging/16000000/15680000/15672600/15672584/eda8431f.jpg?impolicy=resizecrop&rw=670&ra=fit")
coproperty_2 = Coproperty.new(coproperty_name: "City Tower", number_properties: 1500, address: "50, rue Les Cercles, Boulevard le Grand, Casablanca", expense_method: "Variable au Tantième", coprop_private_area: 250000, coprop_common_area: 800000, bank_account: "872556", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_2.photo.attach(io: file_2, filename: "tower.jpg", content_type: "image/jpg")
coproperty_2.save
file_3 = URI.open ("https://www.maisons-maroc.com/img/1032/1032-00267G_25715212.jpg")
coproperty_3 = Coproperty.new(coproperty_name: "Résidence Salma", number_properties: 100, address: "44, Mohammed Mahfoud, Marrakech", expense_method: "Fixe par Habitant", coprop_private_area: 20000, coprop_common_area: 6000, bank_account: "982156", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_3.photo.attach(io: file_3, filename: "salma.jpg", content_type: "image/jpg")
coproperty_3.save
file_4 = URI.open ("https://bonne-affaire.ma/images/com_adsmanager/contents/projet-residence-arwa-immo-haut-fonty_64875_4.jpg?1558782478")
coproperty_4 = Coproperty.new(coproperty_name: "Les Joyaux d'Anfa", number_properties: 30, address: "14, boulevard d'Anfa, Casablanca", expense_method: "Variable au Tantième", coprop_private_area: 1220, coprop_common_area: 820, bank_account: "665556", building_type: "Bâtiment Unique", syndic: syndic_1)
coproperty_4.photo.attach(io: file_4, filename: "anfa.jpg", content_type: "image/jpg")
coproperty_4.save
file_5 = URI.open ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHQcrJZqPxYS01qxoynkLrD_JRG-SBFdRylQ&usqp=CAU")
coproperty_5 = Coproperty.new(coproperty_name: "Résidence La Paix", number_properties: 80, address: "67, boulevard de la Résistance, Casablanca", expense_method: "Fixe par Habitant", coprop_private_area: 4300, coprop_common_area: 1120, bank_account: "886556", building_type: "Bâtiment Unique", syndic: syndic_1)
coproperty_5.photo.attach(io: file_5, filename: "anfa.jpg", content_type: "image/jpg")
coproperty_5.save
file_6 = URI.open("https://q-xx.bstatic.com/xdata/images/hotel/max500/245314751.jpg?k=a0c6ab20a5f55060f013a0c1d8e1322bb3d7354e86da118325e191a8724eb6ea&o=")
coproperty_6 = Coproperty.new(coproperty_name: "Casa Park", number_properties: 140, address: "98, boulevard la Corniche , Casablanca", expense_method: "Fixe par Habitant", coprop_private_area: 6590, coprop_common_area: 2300, bank_account: "213356", building_type: "Bâtiment Unique", syndic: syndic_1)
coproperty_6.photo.attach(io: file_6, filename: "park.jpg", content_type: "image/jpg")
coproperty_6.save
file_7 = URI.open("https://www.yabiladi.com/files/a8cb300c5b566995899c7ea83c276cff.jpg")
coproperty_7 = Coproperty.new(coproperty_name: "Résidence les Iris", number_properties: 900, address: "21, boulevard Mohammed Ayoubi, Bouskoura", expense_method: "Variable au Tantième", coprop_private_area: 185000, coprop_common_area: 53000, bank_account: "098767", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_7.photo.attach(io: file_7, filename: "iris.jpg", content_type: "image/jpg")
coproperty_7.save
file_8 = URI.open ("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXJ8Vi0FchvXFLEjd_gMJQB3HL5wqIJIo8lA&usqp=CAU")
coproperty_8 = Coproperty.new(coproperty_name: "Green View", number_properties: 1200, address: "146, rue Adrien Legrand, Bouskoura", expense_method: "Variable au Tantième", coprop_private_area: 200000, coprop_common_area: 60000, bank_account: "932256", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_8.photo.attach(io: file_8, filename: "view.jpg", content_type: "image/jpg")
coproperty_8.save
file_9 = URI.open ("https://rayaaqqari.com/wp-content/uploads/2021/06/SLIDE-2.jpeg")
coproperty_9 = Coproperty.new(coproperty_name: "Sun House", number_properties: 670, address: "11, rue la marche verte, Dar Bouazza", expense_method: "Variable au Tantième", coprop_private_area: 78000, coprop_common_area: 20000, bank_account: "112256", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_9.photo.attach(io: file_9, filename: "sun.jpg", content_type: "image/jpg")
coproperty_9.save
puts 'Coproperties created'

# Proroperties - Résidence le Rossignol
property_1 = Property.create!(property_number: 1, floor: "RDC", total_property_area: 130, payment_frequency: "Mensuelle", coproperty: coproperty_1, owner: owner_1)
property_2 = Property.create!(property_number: 2, floor: "RDC", total_property_area: 60, payment_frequency: "Trimestrielle", coproperty: coproperty_1, owner: owner_2)
property_3 = Property.create!(property_number: 3, floor: "1", total_property_area: 80, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_3)
property_4 = Property.create!(property_number: 4, floor: "1", total_property_area: 125, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_4)
property_5 = Property.create!(property_number: 5, floor: "2", total_property_area: 150, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_5)
property_6 = Property.create!(property_number: 6, floor: "2", total_property_area: 50, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_6)
property_7 = Property.create!(property_number: 7, floor: "3", total_property_area: 115, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_7)
property_8 = Property.create!(property_number: 8, floor: "3", total_property_area: 95, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_8)
property_9 = Property.create!(property_number: 9, floor: "4", total_property_area: 146, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_9)
property_10 = Property.create!(property_number: 10, floor: "4", total_property_area: 67, payment_frequency: "Annuelle", coproperty: coproperty_1, owner: owner_10)
puts 'Properties created'

# Budgets - Résidence le Rossignol
budget_1 = Budget.create!(budget_type: "Standard", budget_status: "Proposé", budget_start_date: "2023-01-01", budget_end_date: "2023-12-31", budget_amount: 1000000, budget_title:"Budget Annuel 2023",coproperty: coproperty_1)
budget_2 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Validé", budget_start_date: "2023-08-11", budget_end_date: "2022-09-11", budget_amount: 7000, budget_title:"Budget Exceptionnel 2022 - Système Ascenseur",coproperty: coproperty_1)
budget_3 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Rejeté", budget_start_date: "2023-08-11", budget_end_date: "2022-09-11", budget_amount: 9000, budget_title:"Budget Exceptionnel 2022 - Système Ascenseur",coproperty: coproperty_1)
budget_4 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2022-01-01", budget_end_date: "2022-12-31", budget_amount: 1500000, budget_title:"Budget Annuel 2022",coproperty: coproperty_1)
budget_4 = Budget.create!(budget_type: "Standard", budget_status: "Rejeté", budget_start_date: "2022-01-01", budget_end_date: "2022-12-31", budget_amount: 2000000, budget_title:"Budget Annuel 2022",coproperty: coproperty_1)
budget_6 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Validé", budget_start_date: "2021-05-29", budget_end_date: "2021-05-12", budget_amount: 1200, budget_title:"Budget Exceptionnel 2021 - Extension",coproperty: coproperty_1)
budget_7 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Validé", budget_start_date: "2021-08-27", budget_end_date: "2021-08-02", budget_amount: 1900, budget_title:"Budget Exceptionnel 2021 - Isolation",coproperty: coproperty_1)
budget_8 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Rejeté", budget_start_date: "2023-04-23", budget_end_date: "2023-04-02", budget_amount: 3000, budget_title:"Budget Exceptionnel - Ravalement",coproperty: coproperty_1)
budget_9 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2020-01-01", budget_end_date: "2020-12-31", budget_amount: 1300000, budget_title:"Budget Annuel 2021",coproperty: coproperty_1)
budget_10 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2019-01-01", budget_end_date: "2019-12-31", budget_amount: 1200000, budget_title:"Budget Annuel 2020",coproperty: coproperty_1)
budget_11 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2018-01-01", budget_end_date: "2018-12-31", budget_amount: 1100000, budget_title:"Budget Annuel 2019",coproperty: coproperty_1)
budget_12 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2017-01-01", budget_end_date: "2017-12-31", budget_amount: 1250000, budget_title:"Budget Annuel 2018",coproperty: coproperty_1)
budget_13 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2016-01-01", budget_end_date: "2016-12-31", budget_amount: 1370000, budget_title:"Budget Annuel 2017",coproperty: coproperty_1)
budget_14 = Budget.create!(budget_type: "Standard", budget_status: "Validé", budget_start_date: "2015-01-01", budget_end_date: "2015-12-31", budget_amount: 1128000, budget_title:"Budget Annuel 2016",coproperty: coproperty_1)

puts 'Budgets created'

# Expenses - Résidence le Rossignol
expense_1 = Expense.create!(expense_name: "Décoration Nouvel An", expense_type: "Autres", expense_amount: 3400, expense_date: "2022-12-20", expense_status: "Proposé", budget: budget_4)
expense_2 = Expense.create!(expense_name: "Travaux embelissement", expense_type: "Autres", expense_amount: 16700, expense_date: "2022-11-28", expense_status: "Validé", budget: budget_4)
expense_3 = Expense.create!(expense_name: "Frais Nettoyage - 2ème Semestre 2022", expense_type: "Nettoyage", expense_amount: 9300, expense_date: "2022-06-01", expense_status: "Payé", budget: budget_4)
expense_4 = Expense.create!(expense_name: "Frais Jardinage - 2ème Semestre 2022", expense_type: "Jardinage", expense_amount: 18000, expense_date: "2022-06-01", expense_status: "Payé", budget: budget_4)
expense_5 = Expense.create!(expense_name: "Frais Sécurité - 2ème Semestre 2022", expense_type: "Sécurité", expense_amount: 23900, expense_date: "2022-06-01", expense_status: "Payé", budget: budget_4)
expense_6 = Expense.create!(expense_name: "Frais Sécurité - 2ème Semestre 2022", expense_type: "Sécurité", expense_amount: 33450, expense_date: "2022-06-01", expense_status: "Refusé", budget: budget_4)
expense_7 = Expense.create!(expense_name: "Frais Maintenance - 2022", expense_type: "Maintenance", expense_amount: 73400, expense_date: "2022-01-01", expense_status: "Payé", budget: budget_4)
expense_8 = Expense.create!(expense_name: "Frais Consommables - 2022", expense_type: "Consommables", expense_amount: 19000, expense_date: "2022-01-01", expense_status: "Payé", budget: budget_4)
expense_9 = Expense.create!(expense_name: "Autres Frais - 2022", expense_type: "Autres", expense_amount: 8200, expense_date: "2022-01-01", expense_status: "Payé", budget: budget_4)
expense_10 = Expense.create!(expense_name: "Réparation Ascenseur - 2022", expense_type: "Maintenance", expense_amount: 7000, expense_date: "2021-09-30", expense_status: "Payé", budget: budget_9)
expense_11 = Expense.create!(expense_name: "Frais Jardinage - 2021", expense_type: "Jardinage", expense_amount: 5500, expense_date: "2021-02-15", expense_status: "Payé", budget: budget_9)
expense_12 = Expense.create!(expense_name: "Frais Jardinage - 2021", expense_type: "Jardinage", expense_amount: 7900, expense_date: "2021-03-21", expense_status: "Refusé", budget: budget_9)
expense_13 = Expense.create!(expense_name: "Frais Maintenance - 2021", expense_type: "Maintenance", expense_amount: 4300, expense_date: "2021-03-16", expense_status: "Payé", budget: budget_9)
expense_14 = Expense.create!(expense_name: "Frais Sécurité - 2021", expense_type: "Sécurité", expense_amount: 10300, expense_date: "2021-04-02", expense_status: "Payé", budget: budget_9)
puts 'Expenses created'


# Payments - Résidence le Rossignol
payment_1 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-01-28", payment_status: "Reçu", property: property_1, budget: budget_1)
payment_2 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-01-13", payment_status: "Reçu", property: property_2, budget: budget_1)
payment_3 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-02-19", payment_status: "Reçu", property: property_3, budget: budget_1)
payment_4 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-02-03", payment_status: "Reçu", property: property_4, budget: budget_1)
payment_5 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-11-03", payment_status: "Déclaré", property: property_5, budget: budget_1)
payment_6 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-03-15", payment_status: "Reçu", property: property_6, budget: budget_1)
payment_7 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-03-25", payment_status: "Reçu", property: property_7, budget: budget_1)
payment_8 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-11-02", payment_status: "Déclaré", property: property_8, budget: budget_1)
payment_9 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-04-21", payment_status: "Reçu", property: property_9, budget: budget_1)
payment_10 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2022-01-10", payment_status: "Reçu", property: property_10, budget: budget_1)
payment_11 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2021-01-23", payment_status: "Reçu", property: property_1, budget: budget_9)
payment_12 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2021-02-10", payment_status: "Reçu", property: property_2, budget: budget_9)
payment_13 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2021-01-15", payment_status: "Reçu", property: property_3, budget: budget_9)
payment_14 = Payment.create!(payment_title: "Paiement Annuel 2022", payment_amount: "750", payment_date: "2021-01-06", payment_status: "Reçu", property: property_4, budget: budget_9)
puts 'Payments created'

# Requests - Résidence le Rossignol
request_1 = Request.create!(request_title: "Problème Plomberie", message: "Bonjour, j'ai une mauvaise Odeur au niveau de la plomberie, l'odeur remonte des canalisations, veuillez appeler un plombier pour vérifier l'état des canalisations. Merci", request_date: "2022-11-09", request_status: "Soumise", property: property_1)
request_2 = Request.create!(request_title: "Besoin embelissement façades", message: "Salut, je pense qu'on doit absolument refaire les façades, c'est devenu vraiment trés délabré, merci beaucoup par avance !", request_date: "2022-09-23", request_status: "Traitée", property: property_2)
request_3 = Request.create!(request_title: "Suggestion", message: "Bonjour, je veux proposer de créer un groupe de chat pour les personnes intéressées par le jogging à la corniche, pourriez-vous le créer svp et inviter les membres ? Merci", request_date: "2022-0-23", request_status: "Traitée", property: property_5)
request_4 = Request.create!(request_title: "Demande", message: "Bonjour, je souhaite que qu'on installe des caméras au niveau du garage pour veiller à la sécurité de nos véhicules, je propose que vous lancez l'idée en vote, merci", request_date: "2022-04-12", request_status: "Traitée", property: property_4)
request_5 = Request.create!(request_title: "Soucis avec la porte", message: "La poignée de la porte ne marche plus correctement, veuillez faire le nécessaire s'il vous plait, merci.", request_date: "2022-03-18", request_status: "Traitée", property: property_7)
puts 'Requests created'

# Messages - Résidence le Rossignol
message_1 = Message.create!(content: "Bonjour chers habitants", coproperty: coproperty_1, user: user_syndic1)
message_2 = Message.create!(content: "Bonjour", coproperty: coproperty_1, user: user_owner1)
message_3 = Message.create!(content: "Salut", coproperty: coproperty_1, user: user_owner2)
message_4 = Message.create!(content: "Salut les amis, comment ça va ?", coproperty: coproperty_1, user: user_owner3)
message_5 = Message.create!(content: "Coucouuuu", coproperty: coproperty_1, user: user_owner4)
message_6 = Message.create!(content: "J'ai le plaisir de vous annoncer que nous allons organiser un événement sportif !", coproperty: coproperty_1, user: user_syndic1)
message_7 = Message.create!(content: "Waouw c'est génial !", coproperty: coproperty_1, user: user_owner3)
message_8 = Message.create!(content: "C'est top, quand exactement ?", coproperty: coproperty_1, user: user_owner4)
message_9 = Message.create!(content: "Le sport n'est pas fait pour moi, LOL", coproperty: coproperty_1, user: user_owner1)
puts 'Messages created'

# Links
Link.create!(property: property_1)
Link.create!(property: property_2)
Link.create!(property: property_3)
Link.create!(property: property_4)
Link.create!(property: property_5)
Link.create!(property: property_6)
Link.create!(property: property_7)
Link.create!(property: property_8)
Link.create!(property: property_9)
Link.create!(property: property_10)
puts "Links created"


Request.destroy_all
Payment.destroy_all
Expense.destroy_all
Budget.destroy_all
Property.destroy_all
Owner.destroy_all
Syndic.destroy_all
User.destroy_all
Coproperty.destroy_all

user_syndic1 = User.create!(email: "test1@gmail.com", password: "1234556681", role: "Syndic", admin: false)
puts 'User syndic 1 created'

user_syndic2 = User.create!(email: "test2@gmail.com", password: "1234556682", role: "Syndic", admin: false)
puts 'User syndic 2 created'

user_owner1 = User.create!(email: "test3@gmail.com", password: "1234556683", role: "Owner", admin: false)
puts 'User owner 1 created'

user_owner2 = User.create!(email: "test4@gmail.com", password: "1234556684", role: "Owner", admin: false)
puts 'User owner 2 created'

user_owner3 = User.create!(email: "test5@gmail.com", password: "1234556685", role: "Owner", admin: false)
puts 'User owner 3 created'

user_owner4 = User.create!(email: "test6@gmail.com", password: "1234556686", role: "Owner", admin: false)
puts 'User owner 4 created'

user_admin1 = User.create!(email: "testadmin@gmail.com", password: "admin1234556686", admin: true)
puts 'Admin 1 created'

syndic_1 = Syndic.create!(syndic_name: "Your Syndic Pro", creation_date: "2008-01-01", user: user_syndic1)
puts 'Your Syndic Pro created'
syndic_2 = Syndic.create!(syndic_name: "Comfort Syndic", creation_date: "2021-10-01", user: user_syndic2)
puts 'Comfort Syndic created'

owner_1 = Owner.create!(first_name: "Jihane", last_name: "El Jbari", gender: "Femme", card_number: "CD567833", phone_number: "+212618335908", ownership_date: "2022-10-15", birth_date: "1994-04-11", user: user_owner1)
owner_2 = Owner.create!(first_name: "Amal", last_name: "Loudiyi", gender: "Femme", card_number: "CD567844", phone_number: "+212612783321", ownership_date: "2022-01-22", birth_date: "1995-08-22", user: user_owner2)
owner_3 = Owner.create!(first_name: "Yassine", last_name: "Ambari", gender: "Homme", card_number: "CD567822", phone_number: "+212612557766", ownership_date: "2021-12-02", birth_date: "1996-03-01", user: user_owner3)
owner_4 = Owner.create!(first_name: "Houssam", last_name: "Chakir", gender: "Homme", card_number: "CD567866", phone_number: "+212692113488", ownership_date: "2021-11-15", birth_date: "1997-09-21", user: user_owner4)

coproperty_1 = Coproperty.create!(coproperty_name: "Résidence Le Rossignol", number_properties: 10, address: "11, boulevard Roudani, Casablanca", expense_method: "Fixe par Habitant", coprop_private_area: 2000, coprop_common_area: 500, bank_account: "123456788", building_type: "Bâtiment Unique",syndic: syndic_1)
coproperty_2 = Coproperty.create!(coproperty_name: "City Tower", number_properties: 1500, address: "50, rue Les Cercles, Boulevard le Grand, Casablanca", expense_method: "Variable au Tantième", coprop_private_area: 250000, coprop_common_area: 800000, bank_account: "123456789", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_3 = Coproperty.create!(coproperty_name: "Résidence Salma", number_properties: 100, address: "44, Mohammed Mahfoud, Marrakech", expense_method: "Fixe par Habitant", coprop_private_area: 20000, coprop_common_area: 6000, bank_account: "123456790", building_type: "Multi-bâtiments", syndic: syndic_1)
coproperty_4 = Coproperty.create!(coproperty_name: "Les Joyaux d'Anfa", number_properties: 30, address: "14, boulevard d'Anfa, Casablanca", expense_method: "Variable au Tantième", coprop_private_area: 6000, coprop_common_area: 1500, bank_account: "123456791", building_type: "Bâtiment Unique", syndic: syndic_1)
puts 'Coproperties created'

property_1 = Property.create!(property_number: 2, floor: "RDC", total_property_area: 150, payment_frequency: "Mensuelle", coproperty: coproperty_1)
property_2 = Property.create!(property_number: 3, floor: "1", total_property_area: 110, payment_frequency: "Trimestrielle", coproperty: coproperty_1, owner: owner_2)
property_3 = Property.create!(property_number: 12, floor: "2", total_property_area: 80, payment_frequency: "Annuelle", building: "A", coproperty: coproperty_2, owner: owner_1)
property_4 = Property.create!(property_number: 24, floor: "6", total_property_area: 230, payment_frequency: "Annuelle", building: "C", coproperty: coproperty_2, owner: owner_4)
puts 'Properties created'

budget_1 = Budget.create!(budget_type: "Standard", budget_status: "Proposé", budget_start_date: "2023-01-01", budget_end_date: "2023-12-31", budget_amount: 1000000, budget_title:"Budget Annuel 2023",coproperty: coproperty_2)
budget_2 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Proposé", budget_start_date: "2023-08-11", budget_end_date: "2023-09-11", budget_amount: 9000, budget_title:"Budget Exceptionnel - Changement Complet Système Ascenseur",coproperty: coproperty_2)
budget_3 = Budget.create!(budget_type: "Standard", budget_status: "Proposé", budget_start_date: "2023-01-01", budget_end_date: "2023-12-31", budget_amount: 8000, budget_title:"Budget Annuel 2023",coproperty: coproperty_1)
budget_4 = Budget.create!(budget_type: "Exceptionnel", budget_status: "Proposé", budget_start_date: "2023-05-23", budget_end_date: "2023-06-02", budget_amount: 1000, budget_title:"Budget Exceptionnel - Changement des luminaires",coproperty: coproperty_1)
puts 'Budgets created'

expense_1 = Expense.create!(expense_name: "Frais Nettoyage - Janvier 2023", expense_type: "Nettoyage", expense_amount: 4000, expense_date: "2023-01-31", expense_status: "Proposé", budget: budget_1)
expense_2 = Expense.create!(expense_name: "Frais Gardiennage - 1er Semestre 2023", expense_type: "Gardiennage", expense_amount: 9000, expense_date: "2023-06-30", expense_status: "Proposé", budget: budget_1)
puts 'Expenses created'

payment_1 = Payment.create!(payment_title: "Paiement Annuel 2023", payment_amount: "700", payment_date: "01-01-2023", payment_status: "Déclaré", property: property_3, budget: budget_1)
payment_2 = Payment.create!(payment_title: "Paiement Annuel 2023", payment_amount: "1000", payment_date: "01-01-2023", payment_status: "Déclaré", property: property_4, budget: budget_1)
puts 'Payments created'

request_1 = Request.create!(object: "Problème Plomberie", request_title: "Bonjour, j'ai une mauvaise Odeur au niveau de la plomberie, l'odeur remonte des canalisations, veuillez appeler un plombier pour vérifier l'état des canalisations. Merci", request_date: "2022-05-23", request_status: "Soumise", property: property_1)
request_2 = Request.create!(object: "Problème Plomberie 2", request_title: "Bonjour, j'ai une mauvaise Odeur au niveau de la plomberie, l'odeur remonte des canalisations, veuillez appeler un plombier pour vérifier l'état des canalisations. Merci", request_date: "2022-05-23", request_status: "Soumise", property: property_2)
request_3 = Request.create!(object: "Problème Plomberie 3", request_title: "Bonjour, j'ai une mauvaise Odeur au niveau de la plomberie, l'odeur remonte des canalisations, veuillez appeler un plombier pour vérifier l'état des canalisations. Merci", request_date: "2022-05-23", request_status: "Soumise", property: property_3)
request_4 = Request.create!(object: "Problème Plomberie 4", request_title: "Bonjour, j'ai une mauvaise Odeur au niveau de la plomberie, l'odeur remonte des canalisations, veuillez appeler un plombier pour vérifier l'état des canalisations. Merci", request_date: "2022-05-23", request_status: "Soumise", property: property_4)
request_5 = Request.create!(object: "Problème Plomberie 4", request_title: "Bonjour, j'ai une mauvaise Odeur au niveau de la plomberie, l'odeur remonte des canalisations, veuillez appeler un plombier pour vérifier l'état des canalisations. Merci", request_date: "2022-05-23", request_status: "Soumise", property: property_2)


puts 'Request created'

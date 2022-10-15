# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(email: "test2@gmail.com", encrypted_password: "1234556686", password: "1234556686", password_confirmation: "1234556686")
puts 'User created'


Syndic.create!(syndic_name: "Syndic 1", creation_date: "2021-01-01", user_id: 1)
Syndic.create!(syndic_name: "Syndic 2", creation_date: "2022-10-01", user_id: 2)
puts 'Syndic created'

Coproperty.create!(coproperty_name: "Copropiedad 1", number_properties: 5, address: "Calle 1", expense_method: "Mensual", coprop_private_area: 50, coprop_common_area: 500, bank_account: "123456788", syndic_id: 1)
Coproperty.create!(coproperty_name: "Copropiedad 2", number_properties: 10, address: "Calle 2", expense_method: "Mensual", coprop_private_area: 100, coprop_common_area: 1000, bank_account: "123456789", syndic_id: 1)
Coproperty.create!(coproperty_name: "Copropiedad 3", number_properties: 20, address: "Calle 3", expense_method: "Mensual", coprop_private_area: 200, coprop_common_area: 2000, bank_account: "123456790", syndic_id: 1)
Coproperty.create!(coproperty_name: "Copropiedad 4", number_properties: 30, address: "Calle 4", expense_method: "Mensual", coprop_private_area: 300, coprop_common_area: 3000, bank_account: "123456791", syndic_id: 1)
puts 'Coproperties created'

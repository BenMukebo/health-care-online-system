# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
role = Role.find_or_create_by!(name: 'super_admin')
super_user = User.create!(first_name: "Kangu", familly_name: "mamba", email: "kangu@gmail.com", password: "password", agreed_to_terms: true, role_id: role.id)

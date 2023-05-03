# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
role = Role.find_or_create_by!(name: 'admin')
user = User.create(name: "kangu", email: "kangu@gmail.com", password: "password", role_id: role.id)
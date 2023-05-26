if Rails.env.development?

  role1 = Role.find_or_create_by!(name: 'super_admin')
  role2 = Role.find_or_create_by!(name: 'admin')
  role3 = Role.find_or_create_by!(name: 'user')
  role4 = Role.find_or_create_by!(name: 'employee')

  superAdmin = User.create!(first_name: "Kangu", familly_name: "mamba", email: "kangu@gmail.com", password: "password", agreed_to_terms: true, role_id: role1.id)

  image_path = Rails.root.join('app', 'assets', 'images', 'logo.svg')
  superAdmin.image.attach(io: File.open(image_path), filename: 'logo.svg')

  # image = File.open("#{Rails.root}/app/assets/images/logo.svg")
  # superAdmin.image.attach(io: image, filename: "logo.svg")
  # superAdmin.save!

end

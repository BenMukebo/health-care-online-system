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

  puts '----------------------USERS---------------------------'

  30.times do |i|
    User.create!(
      email: Faker::Internet.unique.email,
      password: '123456',
      first_name: Faker::Name.first_name[0..10],
      familly_name: Faker::Name.last_name[0..10],
      phone: Faker::PhoneNumber.cell_phone,
      agreed_to_terms: true,
      role_id: role3.id,
      marital_status: rand(0..4),
      gender: Faker::Gender.binary_type,
      address: { country: Faker::Address.country, city: Faker::Address.city, state: Faker::Address.state },
      # confirmation_sent_at: DateTime.now,
      # confirmed_at: DateTime.now + 1.hour,
      # investment_per_interest: Faker::Number.between(from: 1, to: 10),
    )
  end

  puts '----------------------ORGANIZATIONS---------------------------'

  25.times do |i|
    Organization.create!(
      name: Faker::Company.unique.name, email: Faker::Internet.unique.email, status: rand(0..2),
      register_number: Faker::Company.unique.french_siren_number[4..8], website: Faker::Internet.unique.url,
      # register_number: Faker::UniqueGenerator.clear,
      phone_number: Faker::PhoneNumber.cell_phone, terms_of_service: Faker::Company.catch_phrase,
      location: { country: Faker::Address.country, city: Faker::Address.city, street: Faker::Address.street_address },

      # terms_of_service: Faker::Lorem.paragraph(sentence_count: 3),
      # user_id: user5.id, category_id: rand(1..2)
    )
  end


end

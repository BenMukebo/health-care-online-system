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

  puts '----------------------HOSPITALS---------------------------'

  15.times do |i|
    Hospital.create!(
      name: Faker::Science.unique.element, status: rand(0..2),
      register_number: Faker::NationalHealthService.unique.british_number[4..8], website: Faker::Internet.unique.url,
      phone_number: Faker::PhoneNumber.cell_phone, terms_of_service: Faker::Markdown.ordered_list,
      address: { country: Faker::Address.country, city: Faker::Address.city, street: Faker::Address.street_address },
      data: { body_temperature: Faker::Number.between(from: 36.0, to: 37.5), blood_pressure: Faker::Number.between(from: 80, to: 120), heart_rate: Faker::Number.between(from: 60, to: 100) },
    )
  end

  puts '----------------------CONTRACTS---------------------------'

  RANGE = (1..10).to_a.freeze
  TYPE = ["service", "purchase", "lease", "licensing", "non_disclosure", "memorandum"].freeze

  10.times do |i|
    Contract.create!(
      organization_id: RANGE.sample, hospital_id: rand(1..5), status: rand(0..3),
      start_date: Faker::Date.between(from: 2.days.ago, to: Date.today), end_date: Faker::Date.between(from: Date.today, to: 2.days.from_now),
      value: Faker::Number.between(from: 1000, to: 10000),
      terms_of_agreement: TYPE.sample,
      agreement_type: rand(0..2)
    )
  end
end

require 'administrate/base_dashboard'

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    role: Field::BelongsTo,
    hospital: Field::BelongsToSearch.with_options(class_name: 'Hospital'),
    organization: Field::BelongsToSearch.with_options(class_name: 'Organization'),
    id: Field::Number,
    email: Field::Email,
    first_name: Field::String,
    familly_name: Field::String,
    matricule_number: Field::String,
    # documents: Field::ActiveStorage,
    documents: Field::ActiveStorage.with_options(
      show_display_preview: false,
      delete_document: proc do |admin, resource, document| # destroy_document
        [:custom_delete_document, resource, { document_id: document.id }]
      end
    ),
    # documents: Field::ActiveStorage.with_options(index_display_preview: false),

    image: Field::ActiveStorage,
    # picture: Field::Url,
    password: Field::Password,
    phone: Field::String,
    bio: Field::Text,
    middle_name: Field::String,
    marital_status: Field::Select.with_options(
      searchable: false,
      collection: lambda { |field|
                    field.resource.class.send(field.attribute.to_s.pluralize).keys
                  }
    ),
    gender: Field::Select.with_options(
      collection: User.genders.keys
    ),
    address: Field::String.with_options(searchable: false),
    data: Field::String.with_options(searchable: false),
    # data: Field::JSONB.with_options(searchable: false, html_attributes: { rows: 3 }),
    phyisical_appearence: Field::String.with_options(searchable: false),
    status: Field::Select.with_options(
      searchable: false,
      collection: lambda { |field|
                    field.resource.class.send(field.attribute.to_s.pluralize).keys
                  }
    ),
    agreed_to_terms: Field::Boolean,
    encrypted_password: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    image
    first_name
    email
    marital_status
    role
    status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    image
    email
    phone
    first_name
    familly_name
    marital_status
    gender
    encrypted_password
    matricule_number
    hospital
    organization
    role
    bio
    data
    address
    phyisical_appearence
    status
    documents
    created_at
    updated_at
  ].freeze
  # remember_created_at
  # reset_password_sent_at
  # reset_password_token

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    image
    first_name
    familly_name
    email
    password
    phone
    marital_status
    gender
    bio
    data
    address
    status
    agreed_to_terms
    hospital
    organization
    role
    documents
  ].freeze
  # encrypted_password
  # reset_password_token

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # permitted for has_many_attached
  def permitted_attributes
    super + [documents: []]
  end

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    # "User ##{user.id}"
    user.email
  end
end

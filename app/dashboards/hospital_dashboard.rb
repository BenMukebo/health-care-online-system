require 'administrate/base_dashboard'

class HospitalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    contracts: Field::HasMany,
    id: Field::Number,
    address: Field::String.with_options(searchable: false),
    data: Field::Text.with_options(searchable: false),
    name: Field::String,
    email: Field::Email,
    logo: Field::ActiveStorage,
    phone_number: Field::String,
    register_number: Field::String,
    terms_of_service: Field::Text,
    status: Field::Select.with_options(
      searchable: false,
      collection: lambda { |field|
                    field.resource.class.send(field.attribute.to_s.pluralize).keys
                  }
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    logo
    name
    data
    address
    status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    name
    logo
    data
    address
    terms_of_service
    register_number
    email
    phone_number
    status
    contracts
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    name
    logo
    data
    address
    terms_of_service
    status
    register_number
    email
    phone_number
  ].freeze

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

  # Overwrite this method to customize how hospitals are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(hospital)
    #   "Hospital ##{hospital.id}"
    hospital.name
  end
end

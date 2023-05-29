require 'administrate/base_dashboard'

class HealthcareRequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    data: Field::String.with_options(searchable: false),
    hospital: Field::BelongsTo,
    organization: Field::BelongsTo,
    received: Field::Boolean,
    # rich_text_description: RichTextAreaField, # or
    description: RichTextAreaField,
    status: Field::Number,
    title: Field::String,
    user: Field::BelongsTo,
    valided: Field::Number,
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
    data
    hospital
    organization
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    data
    hospital
    organization
    received
    description
    status
    title
    user
    valided
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    title
    description
    data
    hospital
    organization
    valided
    received
    status
    user
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

  # Overwrite this method to customize how healthcare requests are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(healthcare_request)
  #   "HealthcareRequest ##{healthcare_request.id}"
  # end
end

require 'administrate/base_dashboard'

class ContractDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    agreement_type: Field::Enum,
    end_date: Field::Date,
    hospital: Field::BelongsToSearch.with_options(class_name: 'Hospital'),
    organization: Field::BelongsToSearch.with_options(class_name: 'Organization'),
    start_date: Field::Date,
    # legal_documents: Field::ActiveStorage,
    legal_documents: Field::ActiveStorage.with_options(
      show_display_preview: false,
      destroy_legal_document: proc do |namespace, resource, legal_document|
        [:custom_legal_document_destroy, { legal_document_id: legal_document.id }]
      end
    ),
    renewal_option: Field::Boolean,
    status: Field::Select.with_options(
      searchable: true,
      collection: lambda { |field|
                    field.resource.class.send(field.attribute.to_s.pluralize).keys
                  }
    ),
    terms_of_agreement: Field::Text.with_options(searchable: false),
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
    agreement_type
    organization
    hospital
    start_date
    end_date
    status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    agreement_type
    start_date
    end_date
    organization
    hospital
    legal_documents
    renewal_option
    status
    terms_of_agreement
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    organization
    hospital
    agreement_type
    start_date
    end_date
    legal_documents
    renewal_option
    status
    terms_of_agreement
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

  # permitted for has_many_attached
  def permitted_attributes
    super + [legal_documents: []]
  end

  # Overwrite this method to customize how contracts are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(contract)
    "Contract ##{contract.id}"
  end
end

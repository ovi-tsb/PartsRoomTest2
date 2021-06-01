require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    plant: Field::BelongsTo.with_options(searchable: true),
    id: Field::Number.with_options(searchable: true),
    name: Field::String.with_options(searchable: true),
    created_at: Field::DateTime.with_options(searchable: false),
    updated_at: Field::DateTime.with_options(searchable: false),
    url: Field::String.with_options(searchable: false),
    qty: Field::Number.with_options(searchable: false),
    image: Field::String.with_options(searchable: false),
    description: Field::String.with_options(searchable: true),
    supplier_number: Field::String.with_options(searchable: true),
    item_no: Field::String.with_options(searchable: true),
    location: Field::String.with_options(searchable: true),
    supplier_name: Field::String.with_options(searchable: true),
    status: Field::Select.with_options(searchable: true, collection: ->(field) { field.resource.class.send(field.attribute.to_s.pluralize).keys }),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    plant
    id
    description
    qty
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    plant
    id
    created_at
    updated_at
    url
    qty
    image
    description
    supplier_number
    item_no
    location
    supplier_name
    status
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    plant
    url
    qty
    image
    description
    supplier_number
    item_no
    location
    supplier_name
    status
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

  # Overwrite this method to customize how products are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(product)
  #   "Product ##{product.id}"
  # end
end

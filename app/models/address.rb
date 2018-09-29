#require 'nested_attributes_in_belongs_to'

class Address < ActiveRecord::Base
  #include NestedAttributesInBelongsTo

  belongs_to :address_type
  #process_nested_attributes_in_belongs_to :address_type

end

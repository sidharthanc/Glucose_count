#require 'nested_attributes_in_belongs_to'

class Patient < ActiveRecord::Base
  #include NestedAttributesInBelongsTo

  belongs_to :doctor, class_name: :Person
  belongs_to :patient, class_name: :Person
  belongs_to :guardian, class_name: :Person


  belongs_to :phone_number
#  accepts_nested_attributes_for :phone_number, allow_destroy: true

  belongs_to :address
#  accepts_nested_attributes_for :address, allow_destroy: true

  belongs_to :alt_address, class_name: :Address
#  accepts_nested_attributes_for :alt_address, allow_destroy: true

  belongs_to :alt_phone_number, class_name: :PhoneNumber
 # accepts_nested_attributes_for :alt_phone_number, allow_destroy: true

  belongs_to :salutation

  has_many :prescriptions
  has_many :medical_notes

  
end

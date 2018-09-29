#require 'nested_attributes_in_belongs_to'

class PhoneNumber < ActiveRecord::Base
  belongs_to :phone_number_type
  # 
  #phony_normalize :phone_number, default_country_code: 'US'
end

class Person < ActiveRecord::Base
  self.table_name = "persons"
  has_and_belongs_to_many :roles
  has_many :users
  has_many :patients_of_doctor, foreign_key: "doctor_id"  , class_name: "Patient"
  belongs_to :address
  belongs_to :phone_number
end

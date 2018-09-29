class PatientRole < ActiveRecord::Base
  has_many :roles, :as  => :subrole
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  validates_format_of :email,:with => Devise::email_regexp
  before_save :ensure_authentication_token ,  :ensure_person, :copy_data_to_person
  belongs_to :person

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  def ensure_person
    self.person ||= Person.new
  end

    private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def copy_data_to_person
    self.person.email = email
    names = name.split(' ', 2)
    person.first_name = names[0]
    person.last_name = names[1]
    person.save
  end
end



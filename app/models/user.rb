class User < ApplicationRecord
  has_secure_password

  before_save :capitalize_names

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            email: true #this comes from email_validator gem

  private

  def capitalize_names
    # byebug
    self.first_name = first_name.downcase.capitalize
    self.last_name = last_name.downcase.capitalize
  end

end

class User < ApplicationRecord
  has_secure_password

  has_many :jobs, dependent: :destroy

  before_save :capitalize_names

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            email: true # this comes from email_validator gem

  scope :taimur, -> { where(first_name: "Taimur") }

  def name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def capitalize_names
    # byebug
    self.first_name = first_name.downcase.capitalize
    self.last_name = last_name.downcase.capitalize
  end
end

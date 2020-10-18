class Job < ApplicationRecord
  belongs_to :user
  has_many :employees

  validates :company, presence: true
  validates :website, presence: true
  validates :linkedin, presence: true
  validates :link,
            presence: true,
            uniqueness: true

end

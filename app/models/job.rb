class Job < ApplicationRecord
  belongs_to :user

  has_many :employees, dependent: :destroy

  validates :company, presence: true
  validates :website, presence: true
  validates :linkedin, presence: true
  validates :link,
            presence: true,
            uniqueness: true

  def check_it_out
    "Check out this job I just applied to! Here's the link: #{self.link}"
  end
end

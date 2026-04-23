class Owner < ApplicationRecord
  has_many :pets

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :phone, presence: true
end
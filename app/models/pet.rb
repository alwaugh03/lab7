class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments, dependent: :destroy

  scope :by_species, ->(species) { where(species: species) }

  validates :name, presence: true

  validates :species,
    presence: true,
    inclusion: { in: %w[dog cat rabbit bird reptile other] }

  validates :date_of_birth, presence: true
  validate :date_of_birth_cannot_be_in_future

  validates :weight,
    presence: true,
    numericality: { greater_than: 0 }

  validates :owner, presence: true

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = name.to_s.capitalize
  end

  def date_of_birth_cannot_be_in_future
    return if date_of_birth.blank?

    if date_of_birth > Date.today
      errors.add(:date_of_birth, "cannot be in the future")
    end
  end
end
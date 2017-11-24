class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true

  # Dose is unique for a given cocktail/ingredient couple
  # validates_uniqueness_of :cocktail, scope: :ingredient
  validates :cocktail, uniqueness: { scope: :ingredient }
end

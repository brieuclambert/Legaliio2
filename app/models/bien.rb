class Bien < ApplicationRecord
  belongs_to :dossier
  validates :valeur_empr, :valeur_act, :prix_acq, presence: true, numericality: true
  validates :name, presence: true
end

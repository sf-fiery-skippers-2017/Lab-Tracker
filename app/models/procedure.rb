class Procedure < ApplicationRecord
  belongs_to :experiment

  validates :steps, { presence: true }
end

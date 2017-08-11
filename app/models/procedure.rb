class Procedure < ApplicationRecord
  belongs_to :experiment

  validates :name, :steps, { presence: true }
end

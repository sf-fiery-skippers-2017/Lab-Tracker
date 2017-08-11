class Observation < ApplicationRecord
  belongs_to :observer, class_name: :User
  belongs_to :experiment
  has_many   :comments, as: :commentable

  validates :notes, :experiment_id, :observer_id, { presence: true }
end

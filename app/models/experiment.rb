class Experiment < ApplicationRecord
  belongs_to :lab_staff, class_name: :User
  belongs_to :proposal
  has_many   :observations
  has_many   :procedures
  has_many   :comments, as: :commentable

  validates :title, { presence: true }
end

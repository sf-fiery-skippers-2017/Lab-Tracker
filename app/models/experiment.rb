class Experiment < ApplicationRecord
  belongs_to :lab_staff, class_name: :User
  has_many   :observations
  has_many   :procedures
  has_many   :comments, as: :commentable
  belongs_to :proposal
end

class Observation < ApplicationRecord
  belongs_to :observer, class_name: :User
  belongs_to :experiment
  has_many   :comments, as: :commentable
end

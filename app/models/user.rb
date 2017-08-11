class User < ApplicationRecord
  has_many :comments, foreign_key: :commenter_id
  has_many :observations, foreign_key: :observer_id
  has_many :experiments, foreign_key: :lab_staff_id
  has_many :proposals, foreign_key: :pi_id

  has_secure_password

  validates :first_name, :last_name, :credentials, :email, :password_digest, { presence: true }
end

class Tutor < ApplicationRecord
    validates :name, :identification, :email, :phone, presence: true
    validates :identification, length: { maximum: 11 }
    validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
    validates :phone, length: { maximum: 11 }
end

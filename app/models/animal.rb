class Animal < ApplicationRecord
    validates :name, :birth, :type, :breed, presence: true
end
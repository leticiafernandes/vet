class Animal < ApplicationRecord
    validates :name, :birth, :species, :breed, presence: true
end
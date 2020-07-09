class Animal < ApplicationRecord
    validates :name, :birth, :species, :breed, presence: true
    belongs_to :tutor, optional: true
end
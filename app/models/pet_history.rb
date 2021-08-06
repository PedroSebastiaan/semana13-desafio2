class PetHistory < ApplicationRecord
    belongs_to :pet
    
    validates :weight, presence: true
    validates :heigth, presence: true
    validates :description, presence: true
end

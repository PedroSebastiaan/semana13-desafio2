class Client < ApplicationRecord
    has_many :pets, dependent: :destroy

    def pets_count
        total_pets = 0
        self.pets.each do |pet|
            total_pets += 1
        end
        total_pets
    end
end

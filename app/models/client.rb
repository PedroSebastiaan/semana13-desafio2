class Client < ApplicationRecord
    has_many :pets, dependent: :destroy
end

class User < ApplicationRecord
    has_secure_password

    validates :name, :email, :password, :address, :phone_number, presence: true
    validates :email, uniqueness: true
end

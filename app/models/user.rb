class User < ApplicationRecord
    has_secure_password
    has_many :entries

    validates :email, uniqueness: true
    validates :username, uniqueness: true

    validates :email, presence: true
    validates :username, presence: true
end

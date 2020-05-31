class User < ApplicationRecord
    has_secure_password
    has_many :entries
    has_many :comments, through: :entries

    validates :email, uniqueness: true
    validates :username, uniqueness: true

    # validates :username, length: { minimum: 4 }

    validates :email, presence: true
    validates :username, presence: true


    # validates :username, :email, presence: true, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end

class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_many :books
    has_secure_password
end
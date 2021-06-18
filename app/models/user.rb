class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    ## add custom validators for username and password min 6 char, also check if email is valid
end

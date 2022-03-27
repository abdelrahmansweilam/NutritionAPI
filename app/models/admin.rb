class Admin < ApplicationRecord
    validates :email, :password, presence: true
end

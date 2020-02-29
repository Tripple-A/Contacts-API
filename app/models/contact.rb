# frozen_string_literal: true

class Contact < ApplicationRecord
    validates :LastName, presence: true
    validates :FirstName, presence: true
    validates :PhoneNumber, presence: true
    validates :email, presence: true, uniqueness: true
end

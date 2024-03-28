class CustomerApplication < ApplicationRecord
    validates :name, :mobile, :email, presence: true
    validates :mobile, numericality: { only_integer: true, message: "need to be numbers" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }  
end

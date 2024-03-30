class CustomerApplication < ApplicationRecord
    validates :name, :mobile, :email, :status, :photo, presence: true
    validates :mobile, numericality: { only_integer: true, message: "need to be numbers" }
    validates :mobile, length: { minimum: 10, maximum: 11, message: "need at least 10-11 digits" }
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
    validate :acceptable_image

    has_one_attached :photo

    def acceptable_image
        return unless photo.attached?
      
        # unless photo.blob.byte_size <= 1.megabyte
        #   errors.add(:photo, "is too big")
        # end
      
        acceptable_types = ["image/jpeg", "image/png"]
        unless acceptable_types.include?(photo.content_type)
          errors.add(:photo, "must be a JPEG or PNG")
        end
    end
end

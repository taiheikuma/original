class Part < ApplicationRecord
    has_many :users
    validates :name, presence: true, length: { maximum: 255 }
    
    mount_uploader :image, ImageUploader
end

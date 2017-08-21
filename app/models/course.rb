class Course < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :tasks
  belongs_to :user
end

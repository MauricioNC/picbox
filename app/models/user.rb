class User < ApplicationRecord
  has_many :images
  has_many :boxes
  has_many :boxes_images
  has_many :images_downloads
  has_many :user_interests
  has_many :tags, through: :user_interests
end

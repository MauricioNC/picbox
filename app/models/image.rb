class Image < ApplicationRecord
  belongs_to :user
  has_many :images_tags
  has_many :tags, through: :images_tags
end

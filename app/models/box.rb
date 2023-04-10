class Box < ApplicationRecord
  belongs_to :user
  has_many :boxes_tags
  has_many :tags, through: :boxes_tags
end

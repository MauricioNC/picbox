class Image < ApplicationRecord
  belongs_to :user
  has_many :images_tags
  has_many :tags, through: :images_tags

  def self.search(search)
    tag = Tag.where(tag_name: search)
    self.where(id: ImagesTag.where(tag_id: tag.ids))
  end
end

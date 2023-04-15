class Image < ApplicationRecord
  belongs_to :user
  has_many :images_tags
  has_many :tags, through: :images_tags

  def self.search(search)
    unless search == ""
      tag = Tag.where("tag_name LIKE ?", "%#{search}%")
      self.joins(:images_tags).where("images_tags.tag_id": tag.ids) unless tag.empty?
    end
  end
end

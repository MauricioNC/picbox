class GenerateImageIdentifierJob < ApplicationJob
  queue_as :default

  def perform(image_id, identifier)
    img = Image.find(image_id)
    if img
      img.update(identifier: identifier)
    end
  end
end

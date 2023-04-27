class GenerateIdentifierJob < ApplicationJob
  queue_as :default

  def perform(id, identifier, type)
    if type === "image"
      img = Image.find(id)
      if img
        img.update(identifier: identifier)
      end
    elsif
      box = Box.find(id)
      if box
        box.update(identifier: identifier)
      end
    end
  end
end

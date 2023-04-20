require 'securerandom'

module ImagesConcern
  extend ActiveSupport::Concern

  def get_secure_identifier(n)
    SecureRandom.base58(n)
  end
end

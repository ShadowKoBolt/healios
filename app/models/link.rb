# frozen_string_literal: true

# Represents a users link they want shortening.
class Link < ApplicationRecord
  belongs_to :user

  before_validation :set_short

  validates :long, presence: true
  validates :short, presence: true, uniqueness: true
  validate :long_is_url

  def absolute
    AbsoluteUrlBuilder.call(path: short).to_s
  end

  private

  def long_is_url
    errors.add(:long, 'is not a valid URL') unless UrlChecker.call(string: long)
  end

  def set_short
    return if short

    self.short = generate_reference
    self.short = generate_reference while Link.find_by(short: short)
  end

  def generate_reference
    SecureRandom.hex(6)
  end
end

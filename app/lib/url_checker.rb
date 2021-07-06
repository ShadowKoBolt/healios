# frozen_string_literal: true

# Simple class to check if a string is a URL
class UrlChecker
  class << self
    def call(string:)
      uri = URI.parse(string)
      uri.is_a?(URI::HTTP) && !uri.host.nil?
    rescue URI::InvalidURIError
      false
    end
  end
end

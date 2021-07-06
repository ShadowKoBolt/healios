# frozen_string_literal: true

class AbsoluteUrlBuilder
  class << self
    def call(path:)
      URI::HTTP.build(host: ENV['HOST'], port: ENV['PORT'], path: File.join('/', path))
    end
  end
end

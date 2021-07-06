# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AbsoluteUrlBuilder do
  describe '.call' do
    subject { described_class.call(path: path) }

    context 'with a nil path' do
      let(:path) { nil }
    end

    context 'with a blank path' do
      let(:path) { '' }
    end

    context 'with no port set' do
    end

    context 'with no domain set' do
    end

    context 'with a path with a leading /' do
      let(:path) { '/foo' }
    end

    context 'with a simple string path' do
      let(:path) { 'foo' }
    end
  end
end

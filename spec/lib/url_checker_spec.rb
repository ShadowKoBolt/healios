# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UrlChecker do
  describe '.call' do
    subject { described_class.call(string: string) }

    context 'with a nil string' do
      let(:string) { nil }

      it { is_expected.to eq(false) }
    end

    context 'with a blank string' do
      let(:string) { '' }

      it { is_expected.to eq(false) }
    end

    context 'with a non URL string' do
      let(:string) { 'foobar' }

      it { is_expected.to eq(false) }
    end

    context 'with a non HTTP/HTTPS URL string' do
      let(:string) { 'ftp://google.com' }

      it { is_expected.to eq(false) }
    end

    context 'with a HTTP string' do
      let(:string) { 'http://google.com' }

      it { is_expected.to eq(true) }
    end

    context 'with a HTTPS string' do
      let(:string) { 'https://google.com' }

      it { is_expected.to eq(true) }
    end
  end
end

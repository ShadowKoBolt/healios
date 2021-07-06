# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    before { link.valid? }

    let(:errors) { link.errors.full_messages }

    context 'with a non URL long' do
      let(:link) { described_class.new(long: 'foobar') }

      it { expect(errors).to include('Long is not a valid URL') }
    end

    context 'with a URL long' do
      let(:link) { described_class.new(long: 'http://google.com') }

      it { expect(errors).not_to include('Long is not a valid URL') }
    end
  end
end

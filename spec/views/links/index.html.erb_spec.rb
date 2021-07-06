# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/index', type: :view do
  before(:each) do
    user = User.create!(email: 'a@b.com', password: 'password')
    assign(:links, [
      Link.create!(long: 'http://netflix.com', user: user),
      Link.create!(long: 'http://google.com', user: user)
    ])
  end

  it 'renders a list of links' do
    render
    assert_select 'tr>td', text: 'http://netflix.com'.to_s
    assert_select 'tr>td', text: 'http://google.com'.to_s
  end
end

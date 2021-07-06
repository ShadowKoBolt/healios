# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/show', type: :view do
  before(:each) do
    user = User.create!(email: 'a@b.com', password: 'password')
    @link = assign(:link, Link.create!(long: 'http://google.com', user: user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/http:\/\/google.com/)
  end
end

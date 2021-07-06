# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/show', type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
                            long: 'MyText',
                            short: 'Short'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Short/)
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/index', type: :view do
  before(:each) do
    assign(:links, [
             Link.create!(
               long: 'MyText',
               short: 'Short'
             ),
             Link.create!(
               long: 'MyText',
               short: 'Short'
             )
           ])
  end

  it 'renders a list of links' do
    render
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Short'.to_s, count: 2
  end
end

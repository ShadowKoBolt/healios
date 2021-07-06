# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/new', type: :view do
  before(:each) do
    assign(:link, Link.new(
                    long: 'MyText',
                    short: 'MyString'
                  ))
  end

  it 'renders new link form' do
    render

    assert_select 'form[action=?][method=?]', links_path, 'post' do
      assert_select 'textarea[name=?]', 'link[long]'

      assert_select 'input[name=?]', 'link[short]'
    end
  end
end

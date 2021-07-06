# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'links/edit', type: :view do
  before(:each) do
    user = User.create!(email: 'a@b.com', password: 'password')
    @link = assign(:link, Link.create!(user: user, long: 'http://google.com'))
  end

  it 'renders the edit link form' do
    render

    assert_select 'form[action=?][method=?]', link_path(@link), 'post' do
      assert_select 'input[name=?]', 'link[long]'
    end
  end
end

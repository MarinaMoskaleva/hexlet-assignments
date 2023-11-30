# frozen_string_literal: true

require 'test_helper'

class BulletinsFlowTest < ActionDispatch::IntegrationTest
  test 'can open bullets page' do
    get bulletins_path

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'can open one bullet page' do
    get bulletin_path(bulletins(:bulletin1))

    assert_response :success
    assert_select 'h3', 'Title 1'
    assert_select 'p', 'body 1'
  end
end

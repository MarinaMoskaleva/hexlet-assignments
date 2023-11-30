# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionController::TestCase
  test 'can open bullets page' do
    get :index

    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'can open one bullet page' do
    get :show, params: { id: bulletins(:bulletin1) }

    assert_response :success
    assert_select 'h3', 'Title 1'
    assert_select 'p', 'body 1'
  end
end

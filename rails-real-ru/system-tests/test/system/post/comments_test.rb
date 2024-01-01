# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  test 'creating a Comment' do
    visit posts_path
    click_on 'Show', match: :first
    fill_in('post_comment_body', with: 'Post title')
    click_on 'Create Comment'

    assert_text 'Comment was successfully created.'
  end

  test 'updating a Comment' do
    visit posts_path
    click_on 'Show', match: :first
    click_on 'Edit', match: :first

    click_on 'Update Comment'

    assert_text 'Comment was successfully updated'
  end

  test 'destroying a Comment' do
    visit posts_path
    click_on 'Show', match: :first
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text 'Comment was successfully destroyed'
  end
end


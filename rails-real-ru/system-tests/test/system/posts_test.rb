# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit posts_path
    assert_selector 'h1', text: 'Posts'
  end

  test 'creating a Post' do
    visit posts_path
    click_on 'New Post'
    fill_in('Title', with: 'Post title')
    fill_in('Body', with: 'Post body')

    click_on 'Create Post'

    assert_text 'Post was successfully created.'
  end

  test 'updating a Post' do
    visit posts_path
    click_on 'Edit', match: :first

    click_on 'Update Post'

    assert_text 'Post was successfully updated'
  end

  test 'destroying a Post' do
    visit posts_path
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed'
  end
end


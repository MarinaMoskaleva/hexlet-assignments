require "test_helper"

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @attrs_comment = {
      body: Faker::ChuckNorris.fact
    }
    @post_comment = post_comments(:one)

  end

  test 'should create comment' do
    post post_comments_path(@post), params: { post_comment: @attrs_comment }
    post_comment = PostComment.find_by @attrs_comment

    assert { post_comment }
    assert_redirected_to post_url(@post)
  end

  test 'should show post comments' do
    get post_url(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_comment_path(@post_comment)
    assert_response :success
  end

  test 'should update post comments' do
    patch comment_path(@post_comment), params: { post_comment: @attrs_comment }

    @post_comment.reload

    assert { @post_comment.body == @attrs_comment[:body] }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post comment' do
    delete comment_path(@post_comment)

    assert { !PostComment.exists?(@post_comment.id) }

    assert_redirected_to post_url(@post)
  end
end

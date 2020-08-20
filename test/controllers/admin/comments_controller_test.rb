require "test_helper"

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get admin_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_comment_url
    assert_response :success
  end

  test "should create comment" do
    assert_difference("Comment.count") do
      post admin_comments_url, params: {comment: {}}
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show comment" do
    get admin_comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch admin_comment_url(@comment), params: {comment: {}}
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference("Comment.count", -1) do
      delete admin_comment_url(@comment)
    end

    assert_redirected_to admin_comments_url
  end
end

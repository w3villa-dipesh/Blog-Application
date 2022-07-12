require "test_helper"

class BlogTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog_tag = blog_tags(:one)
  end

  test "should get index" do
    get blog_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_blog_tag_url
    assert_response :success
  end

  test "should create blog_tag" do
    assert_difference('BlogTag.count') do
      post blog_tags_url, params: { blog_tag: { blog_id: @blog_tag.blog_id, tag_id: @blog_tag.tag_id } }
    end

    assert_redirected_to blog_tag_url(BlogTag.last)
  end

  test "should show blog_tag" do
    get blog_tag_url(@blog_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_blog_tag_url(@blog_tag)
    assert_response :success
  end

  test "should update blog_tag" do
    patch blog_tag_url(@blog_tag), params: { blog_tag: { blog_id: @blog_tag.blog_id, tag_id: @blog_tag.tag_id } }
    assert_redirected_to blog_tag_url(@blog_tag)
  end

  test "should destroy blog_tag" do
    assert_difference('BlogTag.count', -1) do
      delete blog_tag_url(@blog_tag)
    end

    assert_redirected_to blog_tags_url
  end
end

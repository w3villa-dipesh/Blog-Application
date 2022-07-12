require "application_system_test_case"

class BlogTagsTest < ApplicationSystemTestCase
  setup do
    @blog_tag = blog_tags(:one)
  end

  test "visiting the index" do
    visit blog_tags_url
    assert_selector "h1", text: "Blog Tags"
  end

  test "creating a Blog tag" do
    visit blog_tags_url
    click_on "New Blog Tag"

    fill_in "Blog", with: @blog_tag.blog_id
    fill_in "Tag", with: @blog_tag.tag_id
    click_on "Create Blog tag"

    assert_text "Blog tag was successfully created"
    click_on "Back"
  end

  test "updating a Blog tag" do
    visit blog_tags_url
    click_on "Edit", match: :first

    fill_in "Blog", with: @blog_tag.blog_id
    fill_in "Tag", with: @blog_tag.tag_id
    click_on "Update Blog tag"

    assert_text "Blog tag was successfully updated"
    click_on "Back"
  end

  test "destroying a Blog tag" do
    visit blog_tags_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blog tag was successfully destroyed"
  end
end

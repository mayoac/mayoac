require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:first)
  end

  test "Creating a new post" do
    visit new_post_path

    fill_in "Title", with: "Success for MayoAC"
    fill_in "Body", with: "Lorem ipsum dolor sit amet"
    click_on "Create Post"

    assert_text "Success for MayoAC"
  end

  test "Showing a post" do
    visit root_path
    click_link @post.title

    assert_selector "h3", text: @post.title
  end
end

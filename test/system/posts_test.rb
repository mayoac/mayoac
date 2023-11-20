require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:first)
  end

  test "Creating a new post" do
    visit new_post_path

    fill_in "Title", with: "Success for MayoAC"
    #fill_in "Content", with: "Lorem ipsum dolor sit amet"
    find(".trix-content").set("Lorem ipsum <strong>dolor sit</strong> amet")
    click_on "Create Post"

    assert_text "Success for MayoAC"
  end

  test "Showing a post" do
    visit root_path
    click_link @post.title

    assert_selector "h2", text: @post.title
  end

  test "Updating a post" do
    visit root_path
    click_link @post.title

    click_on "Edit"
    fill_in "Title", with: "Updated: More success for MayoAC"
    find(".trix-content").set("There was <strong>great happiness</strong>.")
    click_on "Update Post"

    assert_text "More success for MayoAC"
  end
end

require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    Rails.application.routes.default_url_options[:host] = Capybara.current_session.server.host
    Rails.application.routes.default_url_options[:port] = Capybara.current_session.server.port

    @user = users(:bugs)
    @post = posts(:first)
  end

  test "Creating a new post" do
    passwordless_sign_in(@user)
    visit new_post_path

    fill_in "post_title", with: "Success for MayoAC"
    fill_in_rich_text_area "post_content", with: "Lorem ipsum <strong>dolor sit</strong> amet"
    click_on "Create Post"

    assert_text "Success for MayoAC"
  end

  test "Showing a post" do
    visit root_path
    click_link @post.title

    assert_selector "h2", text: @post.title
  end

  test "Updating a post" do
    passwordless_sign_in(@user)
    visit root_path
    click_link @post.title

    click_on "Edit"
    fill_in "Title", with: "Updated: More success for MayoAC"
    fill_in_rich_text_area "post_content", with: "There was <strong>great happiness</strong>."
    click_on "Update Post"

    assert_text "More success for MayoAC"
  end

  test "Destroying a post" do
    passwordless_sign_in(@user)
    visit root_path
    assert_text @post.title

    click_link @post.title
    click_on "Delete"

    assert_no_text @post.title
  end
end

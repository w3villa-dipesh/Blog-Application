require "application_system_test_case"

class HobbiesTest < ApplicationSystemTestCase
  setup do
    @hobby = hobbies(:one)
  end

  test "visiting the index" do
    visit hobbies_url
    assert_selector "h1", text: "Hobbies"
  end

  test "creating a Hobby" do
    visit hobbies_url
    click_on "New Hobby"

    fill_in "Name", with: @hobby.name
    fill_in "User", with: @hobby.user_id
    click_on "Create Hobby"

    assert_text "Hobby was successfully created"
    click_on "Back"
  end

  test "updating a Hobby" do
    visit hobbies_url
    click_on "Edit", match: :first

    fill_in "Name", with: @hobby.name
    fill_in "User", with: @hobby.user_id
    click_on "Update Hobby"

    assert_text "Hobby was successfully updated"
    click_on "Back"
  end

  test "destroying a Hobby" do
    visit hobbies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hobby was successfully destroyed"
  end
end

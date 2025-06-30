require "application_system_test_case"

class GetTopAlbumsTest < ApplicationSystemTestCase
  setup do
    @get_top_album = get_top_albums(:one)
  end

  test "visiting the index" do
    visit get_top_albums_url
    assert_selector "h1", text: "Get top albums"
  end

  test "should create get top album" do
    visit get_top_albums_url
    click_on "New get top album"

    click_on "Create Get top album"

    assert_text "Get top album was successfully created"
    click_on "Back"
  end

  test "should update Get top album" do
    visit get_top_album_url(@get_top_album)
    click_on "Edit this get top album", match: :first

    click_on "Update Get top album"

    assert_text "Get top album was successfully updated"
    click_on "Back"
  end

  test "should destroy Get top album" do
    visit get_top_album_url(@get_top_album)
    click_on "Destroy this get top album", match: :first

    assert_text "Get top album was successfully destroyed"
  end
end

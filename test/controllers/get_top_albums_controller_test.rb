require "test_helper"

class GetTopAlbumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @get_top_album = get_top_albums(:one)
  end

  test "should get index" do
    get get_top_albums_url
    assert_response :success
  end

  test "should get new" do
    get new_get_top_album_url
    assert_response :success
  end

  test "should create get_top_album" do
    assert_difference("GetTopAlbum.count") do
      post get_top_albums_url, params: { get_top_album: {} }
    end

    assert_redirected_to get_top_album_url(GetTopAlbum.last)
  end

  test "should show get_top_album" do
    get get_top_album_url(@get_top_album)
    assert_response :success
  end

  test "should get edit" do
    get edit_get_top_album_url(@get_top_album)
    assert_response :success
  end

  test "should update get_top_album" do
    patch get_top_album_url(@get_top_album), params: { get_top_album: {} }
    assert_redirected_to get_top_album_url(@get_top_album)
  end

  test "should destroy get_top_album" do
    assert_difference("GetTopAlbum.count", -1) do
      delete get_top_album_url(@get_top_album)
    end

    assert_redirected_to get_top_albums_url
  end
end

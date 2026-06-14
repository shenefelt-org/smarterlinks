require "test_helper"

class MSpacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @m_space = m_spaces(:one)
  end

  test "should get index" do
    get m_spaces_url
    assert_response :success
  end

  test "should get new" do
    get new_m_space_url
    assert_response :success
  end

  test "should create m_space" do
    assert_difference("MSpace.count") do
      post m_spaces_url, params: { m_space: { profile_pic: @m_space.profile_pic } }
    end

    assert_redirected_to m_space_url(MSpace.last)
  end

  test "should show m_space" do
    get m_space_url(@m_space)
    assert_response :success
  end

  test "should get edit" do
    get edit_m_space_url(@m_space)
    assert_response :success
  end

  test "should update m_space" do
    patch m_space_url(@m_space), params: { m_space: { profile_pic: @m_space.profile_pic } }
    assert_redirected_to m_space_url(@m_space)
  end

  test "should destroy m_space" do
    assert_difference("MSpace.count", -1) do
      delete m_space_url(@m_space)
    end

    assert_redirected_to m_spaces_url
  end
end

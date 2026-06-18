require "test_helper"

class MSpaceTest < ActiveSupport::TestCase
  setup do
    @original_asset_server_url = ENV["ASSET_SERVER_URL"]
    @original_asset_server_upload_url = ENV["ASSET_SERVER_UPLOAD_URL"]
    @original_asset_server_api_url = ENV["ASSET_SERVER_API_URL"]

    ENV["ASSET_SERVER_URL"] = "https://assets.example.com"
    ENV["ASSET_SERVER_UPLOAD_URL"] = "https://assets.example.com/upload"
    ENV["ASSET_SERVER_API_URL"] = "https://assets.example.com/api"
  end

  teardown do
    ENV["ASSET_SERVER_URL"] = @original_asset_server_url
    ENV["ASSET_SERVER_UPLOAD_URL"] = @original_asset_server_upload_url
    ENV["ASSET_SERVER_API_URL"] = @original_asset_server_api_url
  end

  test "returns asset server env values from the class" do
    assert_equal "https://assets.example.com", MSpace.asset_server_url
    assert_equal "https://assets.example.com/upload", MSpace.asset_server_upload_url
    assert_equal "https://assets.example.com/api", MSpace.asset_server_api_url
  end

  test "returns asset server env values from an instance" do
    m_space = m_spaces(:one)

    assert_equal "https://assets.example.com", m_space.asset_server_url
    assert_equal "https://assets.example.com/upload", m_space.asset_server_upload_url
    assert_equal "https://assets.example.com/api", m_space.asset_server_api_url
  end
end

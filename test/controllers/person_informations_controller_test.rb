require "test_helper"

class PersonInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person_information = person_informations(:one)
  end

  test "should get index" do
    get person_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_person_information_url
    assert_response :success
  end

  test "should create person_information" do
    assert_difference("PersonInformation.count") do
      post person_informations_url, params: { person_information: { address: @person_information.address, dob: @person_information.dob } }
    end

    assert_redirected_to person_information_url(PersonInformation.last)
  end

  test "should show person_information" do
    get person_information_url(@person_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_information_url(@person_information)
    assert_response :success
  end

  test "should update person_information" do
    patch person_information_url(@person_information), params: { person_information: { address: @person_information.address, dob: @person_information.dob } }
    assert_redirected_to person_information_url(@person_information)
  end

  test "should destroy person_information" do
    assert_difference("PersonInformation.count", -1) do
      delete person_information_url(@person_information)
    end

    assert_redirected_to person_informations_url
  end
end

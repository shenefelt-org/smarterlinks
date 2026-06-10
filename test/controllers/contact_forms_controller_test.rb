require "test_helper"

class ContactFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact_form = contact_forms(:one)
  end

  test "should get index" do
    get contact_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_contact_form_url
    assert_response :success
  end

  test "should create contact_form" do
    assert_difference("ContactForm.count") do
      post contact_forms_url, params: { contact_form: { email: @contact_form.email, name: @contact_form.name } }
    end

    assert_redirected_to contact_form_url(ContactForm.last)
  end

  test "should show contact_form" do
    get contact_form_url(@contact_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_contact_form_url(@contact_form)
    assert_response :success
  end

  test "should update contact_form" do
    patch contact_form_url(@contact_form), params: { contact_form: { email: @contact_form.email, name: @contact_form.name } }
    assert_redirected_to contact_form_url(@contact_form)
  end

  test "should destroy contact_form" do
    assert_difference("ContactForm.count", -1) do
      delete contact_form_url(@contact_form)
    end

    assert_redirected_to contact_forms_url
  end
end

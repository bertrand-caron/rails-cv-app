require 'test_helper'

class InternshipsControllerTest < ActionController::TestCase
  setup do
    @internship = internships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internship" do
    assert_difference('Internship.count') do
      post :create, internship: { description: @internship.description, hyperlink: @internship.hyperlink, report_path: @internship.report_path, title: @internship.title }
    end

    assert_redirected_to internship_path(assigns(:internship))
  end

  test "should show internship" do
    get :show, id: @internship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internship
    assert_response :success
  end

  test "should update internship" do
    patch :update, id: @internship, internship: { description: @internship.description, hyperlink: @internship.hyperlink, report_path: @internship.report_path, title: @internship.title }
    assert_redirected_to internship_path(assigns(:internship))
  end

  test "should destroy internship" do
    assert_difference('Internship.count', -1) do
      delete :destroy, id: @internship
    end

    assert_redirected_to internships_path
  end
end

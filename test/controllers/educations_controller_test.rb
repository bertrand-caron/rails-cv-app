require 'test_helper'

class EducationsControllerTest < ActionController::TestCase
  setup do
    @education = educations(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:educations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create education' do
    assert_difference('Education.count') do
      post :create, education: { degree: @education.degree, description: @education.description, institution: @education.institution, institution_location: @education.institution_location, year: @education.year }
    end

    assert_redirected_to education_path(assigns(:education))
  end

  test 'should show education' do
    get :show, id: @education
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @education
    assert_response :success
  end

  test 'should update education' do
    patch :update, id: @education, education: { degree: @education.degree, description: @education.description, institution: @education.institution, institution_location: @education.institution_location, year: @education.year }
    assert_redirected_to education_path(assigns(:education))
  end

  test 'should destroy education' do
    assert_difference('Education.count', -1) do
      delete :destroy, id: @education
    end

    assert_redirected_to educations_path
  end
end

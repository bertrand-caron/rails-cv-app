require 'test_helper'

class ProgrammingSkillsControllerTest < ActionController::TestCase
  setup do
    @programming_skill = programming_skills(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:programming_skills)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create programming_skill' do
    assert_difference('ProgrammingSkill.count') do
      post :create, programming_skill: { description: @programming_skill.description, details: @programming_skill.details, hyperlink: @programming_skill.hyperlink, rank: @programming_skill.rank, ranking: @programming_skill.ranking, title: @programming_skill.title, type: @programming_skill.type }
    end

    assert_redirected_to programming_skill_path(assigns(:programming_skill))
  end

  test 'should show programming_skill' do
    get :show, id: @programming_skill
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @programming_skill
    assert_response :success
  end

  test 'should update programming_skill' do
    patch :update, id: @programming_skill, programming_skill: { description: @programming_skill.description, details: @programming_skill.details, hyperlink: @programming_skill.hyperlink, rank: @programming_skill.rank, ranking: @programming_skill.ranking, title: @programming_skill.title, type: @programming_skill.type }
    assert_redirected_to programming_skill_path(assigns(:programming_skill))
  end

  test 'should destroy programming_skill' do
    assert_difference('ProgrammingSkill.count', -1) do
      delete :destroy, id: @programming_skill
    end

    assert_redirected_to programming_skills_path
  end
end

require 'spec_helper'

describe UsersController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

#  describe 'GET #index' do
#    before(:each) { get :index }
#    context 'with logged in admin user' do
#      before { login(user) }
#      it 'populates an array of users'
#      it 'renders the :index template' do
#        expect(response).to render_template(:index)
#      end
#      it 'displays a button for adding users' do
#        expect(response.body).to have_content('Add User')
#      end
#    end
#    context 'with lamdba user' do
#      it 'redirects to the sign in page' do
#        expect(response).to redirect_to signin_path
#      end
#    end
#  end

  describe 'GET #show' do
    it 'assigns the requested user to @user'
    it 'renders the :show template'
  end

  describe 'GET #create' do
    context 'with valid attributes' do
      it 'saves the new user to the database'
      it 'redirects to the home page'
    end
    context 'with invalid attributes' do
      it 'does not save the contact to the database'
      it 're-renders the :new template'
    end
  end
end

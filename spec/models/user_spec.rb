require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'is invalid without a name' do
    expect(FactoryGirl.build(:user, name: nil)).to be_invalid
  end
  it 'has a valid email'
  it 'does not allow duplicated emails' do
    first_user = FactoryGirl.create(:user)
    expect(FactoryGirl.build(:user, email: first_user.email) ).not_to be_valid
  end
end

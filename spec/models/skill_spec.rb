require 'spec_helper'

describe Skill do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:skill)).to be_valid
  end

  it 'is invalid without a ranking' do
    expect(FactoryGirl.build(:skill, level: nil)).to be_invalid
  end

  it 'is invalid is the ranking is not a number between 0 and 5 (For instance, 6)' do
    expect(FactoryGirl.build(:skill, level: 6)).to be_invalid
  end

  it 'is invalid without a skill_type' do
    expect(FactoryGirl.build(:skill, skill_type: nil)).to be_invalid
  end
end

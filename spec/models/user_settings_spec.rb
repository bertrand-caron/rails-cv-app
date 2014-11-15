require 'spec_helper'

describe UserSettings do
  it 'can create a new setting with set_param_to' do
    UserSettings.set_param_to('Foo', 'Bar')
    expect(UserSettings.Foo).to eq('Bar')
  end

  it 'can destroy a setting with :destroy' do
    UserSettings.set_param_to('Foo', 'Bar')
    UserSettings.destroy :Foo
    expect(UserSettings.Foo).to eq(nil)
  end

  it 'can preserve an already set parameter with :init_param_to' do
    UserSettings.set_param_to('Foo', 'Bar')
    UserSettings.init_param_to('Foo', 'Bob')
    expect(UserSettings.Foo).to eq('Bar')
  end
end

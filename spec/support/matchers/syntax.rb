RSpec::Matchers.define :have_add_button do |_expected|
  match do |actual|
    expect(actual.body).to have_selector('input[type=submit]')
  end
end

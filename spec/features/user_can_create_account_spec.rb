require 'rails_helper'

RSpec.describe 'User can create an account' do
  scenario 'unregistered can register for account' do
    visit login_path

    expect(page).to have_link("Register")

    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in "user[first_name]", with: "Emma"
    fill_in "user[last_name]", with: "Swan"
    fill_in "user[address]", with: "123 Lane Storybrooke, MA 23451"
    fill_in "user[email]", with: "swan@ouat.com"
    fill_in "user[password]", with: "Henry"

    click_on "Register"

    expect(current_path).to eq(dashboard_path)
  end
end
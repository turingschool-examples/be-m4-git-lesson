require 'rails_helper'

RSpec.describe 'User can create an account' do
  scenario 'unregistered can register for account' do
    visit login_path

    expect(page).to have_link("Create Account")

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[first_name]", with: "Emma"
    fill_in "user[last_name]", with: "Swan"
    fill_in "user[address]", with: "123 Storybrooke Lane, MA 23451"
    fill_in "user[email]", with: "swan@ouat.com"
    fill_in "user[password]", with: "Henry"

    click_on "Register"

    user = User.last

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("#{user.first_name}")
    expect(page).to have_content("#{user.last_name}")
    expect(page).to have_content("#{user.address}")
  end
end
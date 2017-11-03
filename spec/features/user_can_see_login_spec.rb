require 'rails_helper'

RSpec.feature "User can see a login" do
  scenario "when visit root page" do
    visit root_path

    expect(page).to have_link("Log In")
  end

  scenario "when I click login I should be on login page" do
    visit root_path

    click_on "Log In"

    expect(current_path).to eq(login_path)
  end

  scenario "registered user can log in" do
    user = User.create(first_name: "John",
                       last_name: "Doe",
                       email: "John@Doe.com",
                       password: "test",
                       address: "123 House Lane Denver, CO 80231")
    visit login_path

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_on  "Submit"

    expect(current_path).to eq dashboard_path
    expect(page).to have_content("Logged in as #{user.first_name}")
    expect(page).to have_content("Log Out")
  end
end

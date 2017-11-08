require 'rails_helper'

RSpec.describe 'Admin can visit profile page' do
  let!(:admin) { create(:user, role: 1) }
  let!(:other_admin) { create(:user, role: 1) }

  scenario 'and they can see their credentials' do
    visit login_path

    fill_in "session[email]",    with: "#{admin.email}"
    fill_in "session[password]", with: "#{admin.password}"

    click_on "Submit"

    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content("Welcome, #{admin.first_name}")
    expect(page).to have_content("Log Out")

    click_on "User Profile"

    expect(current_path).to eq("/admin/users/#{admin.id}")
    expect(page).to have_content("Position: Administrator")
    expect(page).to have_content("Name: #{admin.first_name} #{admin.last_name}")
    expect(page).to have_content("Email: #{admin.email}")
    expect(page).to have_content("Address: #{admin.address}")
    expect(page).to have_link("Edit Profile")
  end

  it 'and they can edit their credentials' do
    visit login_path

    fill_in "session[email]",    with: "#{admin.email}"
    fill_in "session[password]", with: "#{admin.password}"

    click_on "Submit"

    expect(current_path).to eq('/admin/dashboard')
    expect(page).to have_content("Welcome, #{admin.first_name}")
    expect(page).to have_content("Log Out")

    click_on "User Profile"
    click_on "Edit Profile"

    expect(current_path).to eq(edit_admin_user_path(admin))
    expect(page).to have_content("Welcome, #{admin.first_name}")
    expect(find_field('Email').value).to eq("#{admin.email}")
    expect(find_field('First name').value).to eq("#{admin.first_name}")
    expect(find_field('Last name').value).to eq("#{admin.last_name}")
    expect(find_field('Address').value).to eq("#{admin.address}")
    expect(page).to have_button("Update")

    fill_in "user[email]",      with: "emma@swan.com"
    fill_in "user[first_name]", with: "Emma"
    fill_in "user[last_name]",  with: "Swan"
    fill_in "user[address]",    with: "1234 Enchanted Ave. Storybrooke, MA 49295"

    click_on "Update"

    expect(current_path).to eq("/admin/users/#{admin.id}")
    expect(page).to have_content("Profile successfully updated!")
    expect(page).to have_content("Welcome, Emma")
    expect(page).to have_content("Position: Administrator")
    expect(page).to have_content("Name: Emma Swan")
    expect(page).to have_content("Email: emma@swan.com")
    expect(page).to have_content("Address: 1234 Enchanted Ave. Storybrooke, MA 49295")
    expect(page).to have_link("Edit Profile")
  end
end
require 'rails_helper'

RSpec.describe 'Users can only see their own data' do
  let!(:user)       { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:admin)      { create(:user, role: 1) }

  it 'user can only see their own data' do
    visit login_path

    expect(current_path).to eq("/login")
    expect(page).to have_content("Log In")
    expect(page).to have_button("Submit")
    expect(page).to have_link("Create Account")

    fill_in "session[email]",    with: "#{user.email}"
    fill_in "session[password]", with: "#{user.password}"

    click_on "Submit"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("#{user.first_name} #{user.last_name}")
    expect(page).to have_content("#{user.address}")
    expect(page).not_to have_content("#{other_user.first_name} #{other_user.last_name}")
    expect(page).not_to have_content("#{other_user.address}")
    expect(page).not_to have_content("#{admin.first_name} #{admin.last_name}")
    expect(page).not_to have_content("#{admin.address}")
  end

  it 'user cannot see other users order info' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    order = user.orders.create

    visit orders_path

    expect(current_path).to eq('/orders')
    expect(page).to have_content("#{order.id}")
    expect(page).to have_content("#{order.format_date(order.created_at)}")
    expect(page).to have_button("View Order")
  end

  it 'user cannot view an administrators screen' do
    visit login_path

    fill_in "session[email]",    with: "#{user.email}"
    fill_in "session[password]", with: "#{user.password}"

    click_on "Submit"

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("#{user.first_name} #{user.last_name}")
    expect(page).to have_content("#{user.address}")

    visit admin_dashboard_path

    expect(page.status_code).to eq(404)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it 'user cannot make themself an admin' do
    visit login_path

    click_on "Create Account"

    fill_in "user[first_name]", with: "Emma"
    fill_in "user[last_name]",  with: "Swan"
    fill_in "user[address]",    with: "123 Storybrooke Lane, MA 23451"
    fill_in "user[email]",      with: "swan@ouat.com"
    fill_in "user[password]",   with: "Henry"

    expect(page).not_to have_content("Role")
    expect(page).not_to have_content("Admin")

    click_on "Register"

    user = User.last

    expect(current_path).to eq(dashboard_path)
    expect(user.admin?).to be false
    expect(page).to have_content("#{user.first_name}")
    expect(page).to have_content("#{user.last_name}")
  end
end

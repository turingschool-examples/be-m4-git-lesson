require 'rails_helper'

RSpec.feature "An admin logs in" do
  scenario "admin redirected to admin dashboard page when logged in" do
    admin = User.create(first_name: 'Django',
                        last_name: 'Unchained',
                        email: 'cool',
                        address: 'wherever',
                        password: 'django',
                        role: 1)

    visit login_path

    fill_in "session[email]",    with: admin.email
    fill_in "session[password]", with: admin.password
    click_on "Submit"

    expect(current_path).to eq(admin_dashboard_path)
  end
end
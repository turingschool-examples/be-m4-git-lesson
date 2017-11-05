require 'rails_helper'

RSpec.feature "As a non admin" do
  context "as a visitor" do
    it 'I visit admin/dashboard and receive status 404' do
      visit admin_dashboard_path

      expect(page.status_code).to eq(404)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  context "as an authenticated user" do
    it 'I visit admin/dashboard and receive status 404' do
      user = User.create(first_name: 'Django',
                          last_name: 'Unchained',
                          email: 'cool',
                          address: 'wherever',
                          password: 'django',
                          role: 0)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_dashboard_path

      expect(page.status_code).to eq(404)
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
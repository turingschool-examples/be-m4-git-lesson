require 'rails_helper'

RSpec.feature "User can see a login" do
  scenario "when visit root page" do
    visit root_path

    expect(page).to have_link("Log In")
  end
end

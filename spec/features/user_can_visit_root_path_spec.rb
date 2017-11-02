require 'rails_helper'

RSpec.describe "User can visit root path" do
  scenario "and they see things" do
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to have_content("About Us")
  end
end
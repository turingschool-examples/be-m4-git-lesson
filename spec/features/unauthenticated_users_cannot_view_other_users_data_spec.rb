require "rails_helper"

RSpec.describe 'Unauthenticated users' do
  xit 'cannot view other users private data' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Log In")

    click_on "The Conservatory"

    visit '/dashboard'

    expect(page.status_code).to eq(404)

    visit '/orders'

    expect(page.status_code).to eq(404)
  end
end
require "rails_helper"

RSpec.describe 'Unauthenticated users' do
  it 'cannot view other users private data' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_link("Log In")

    visit '/dashboard'

    expect(current_path).to eq('/login')

    visit '/orders'

    expect(current_path).to eq('/login')
  end
end
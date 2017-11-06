require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "logged in user can log out" do
    user = User.create(first_name: "John",
                        last_name: "Doe",
                        email: "John@Doe.com",
                        password: "test",
                        address: "123 House Lane Denver, CO 80231")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path
    
    click_on "Log Out"

    expect(current_path).to eq(root_path)
  end
end

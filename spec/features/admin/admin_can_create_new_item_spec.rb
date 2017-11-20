require 'rails_helper'

RSpec.describe 'Admin can create new item' do
  let!(:admin) { create(:user, role: 1) }

  it 'from a link on the admin dashboard' do
    visit '/'

    click_on "Log In"

    expect(current_path).to eq(login_path)

    fill_in "session[email]",    with: admin.email
    fill_in "session[password]", with: admin.password
    click_on "Submit"


    expect(page).to have_content("Welcome, #{admin.first_name}")
    expect(page).to have_content("All Orders")
    expect(page).to have_link("Ordered")
    expect(page).to have_link("Paid")
    expect(page).to have_link("Create New Item")
  end

  it 'by clicking on create new item link and submitting form' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content("Welcome, #{admin.first_name}")
    expect(page).to have_link("Create New Item")

    click_on "Create New Item"

    expect(current_path).to eq(new_admin_item_path)
    expect(page).to have_field("Title")
    expect(page).to have_field("Description")
    expect(page).to have_field("Price")
    expect(page).to have_field("Status")
    expect(page).to have_select("item[category_id]")
    expect(page).to have_button("Create Item")
  end

  it 'by filling out all the required fields' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    Category.create(title: "Pretty But Deadly")
    visit admin_dashboard_path
    click_on "Create New Item"

    expect(current_path).to eq(new_admin_item_path)
    fill_in "item[title]",       with: "Night Shade Flower"
    fill_in "item[description]", with: "It's poisonous!"
    fill_in "item[price]",       with: "19.95"
    select "Active",             from: "item[status]"
    select "Pretty But Deadly",  from: "item[category_id]"
    attach_file("item[image]", File.join(Rails.root, '/app/assets/images/1.jpg'))

    click_on "Create Item"

    expect(current_path).to eq(admin_items_path)
  end
end
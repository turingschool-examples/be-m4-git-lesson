require 'rails_helper'

RSpec.describe "Visitor visits items index" do
  let(:category) { create(:category) }

  scenario "visitor sees items on the page" do
    item = create(:item, category: category)

    visit items_path

    expect(current_path).to eq '/items'
    expect(page).to have_content(item.title)
    expect(page).to have_css(".image")
  end
end

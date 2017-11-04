require 'rails_helper'

RSpec.describe 'Visitor can see item show page' do
  let!(:category1) { create(:category) }
  let!(:category2) { create(:category) }
  let!(:item1) { create(:item, category: category1)}
  let!(:item2) { create(:item, category: category1)}
  let!(:item3) { create(:item, category: category2)}
  let!(:item4) { create(:item, category: category2)}

  scenario 'can see item show page' do
    visit item_path(item1)

    expect(current_path).to eq "/items/#{item1.id}"
    expect(page).to have_content(item1.title)

    expect(page).to have_css(".image")
    expect(page).to have_content(item1.price)
    expect(page).to have_button("Add to Cart")
  end
end
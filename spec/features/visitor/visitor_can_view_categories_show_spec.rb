require 'rails_helper'

RSpec.feature "Visitor visits category show page" do
  let!(:category1) { create(:category) }
  let!(:category2) { create(:category) }
  let!(:item1) { create(:item, category: category1)}
  let!(:item2) { create(:item, category: category1)}
  let!(:item3) { create(:item, category: category2)}
  let!(:item4) { create(:item, category: category2)}

  scenario "and sees items related to that category" do
    visit category_path(category1.slug)

    expect(current_path).to eq("/#{category1.slug}")
    expect(page).to have_content(category1.title)
    expect(page).to have_content(item1.title)
    expect(page).to have_content(item2.title)
    expect(page).to have_css('.image')

    visit category_path(category2.slug)

    expect(current_path).to eq("/#{category2.slug}")
    expect(page).to have_content(category2.title)
    expect(page).to have_content(item3.title)
    expect(page).to have_content(item4.title)
  end
end

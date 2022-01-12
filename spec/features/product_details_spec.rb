require 'rails_helper'

RSpec.feature "Visitor navigates to individual product details", type: :feature, js: true do

before :each do
  @category = Category.create! name: 'Apparel'

10.times do |n|
  @category.products.create!(
    name:  Faker::Hipster.sentence(3),
    description: Faker::Hipster.paragraph(4),
    image: open_asset('apparel1.jpg'),
    quantity: 10,
    price: 64.99
    )
    end
  end

scenario "Users can view product details by selecting a product" do

  visit root_path

  expect(page).to have_css 'article.product', count: 10

  find('article header a', match: :first).click

  expect(page).to have_css 'article.product-detail'

  save_screenshot

  end



end

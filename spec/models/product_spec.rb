require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before do
      @category = Category.new(id: 1, name: "Apparel")
      @product = Product.new(id: 1, name: "Grey Wool Toque", price_cents: 200, quantity: 75, category: @category)
end

it "is "

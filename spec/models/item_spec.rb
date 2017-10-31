require 'rails_helper'

RSpec.describe Item do 
	describe 'Validations' do

		context 'valid attributes' do
			it "is valid without a title" do
				category = Category.create(title: "cactus")
				item = Item.create(title: "cactus",
										  		description:	"It has flowers",
											  	price: 10,
												  category: category,
												  status: 0,
												  image_file_name: "FullSizeRender.jpg", 
												  image_content_type: "image/jpeg", 
												  image_file_size: 346843)

				expect(item).to be_valid
			end
		end

		context 'invalid attributes' do
			it "is invalid without a description" do
				category = Category.create(title: "cactus")
				item = Item.new(title: "Plant",
												price: 10,
												image_file_name: "FullSizeRender.jpg", 
												image_content_type: "image/jpeg", 
												image_file_size: 346843,
												category: category,
												status: 0)

					expect(item).to be_invalid
			end

			it "is invalid without a title" do
				category = Category.create(title: "cactus")
				item = Item.new(description:	"It has flowers",
												price: 10,
												image_file_name: "FullSizeRender.jpg", 
												image_content_type: "image/jpeg", 
												image_file_size: 346843,
												category: category,
												status: 0)

					expect(item).to be_invalid
			end

			it "is invalid without a price" do
				category = Category.create(title: "cactus")
				item = Item.create(title: "cactus",
												description:	"It has flowers",
												category: category,
												status: 0,
												image_file_name: "FullSizeRender.jpg", 
												image_content_type: "image/jpeg", 
												image_file_size: 346843)

					expect(item).to be_invalid
			end

			it "is invalid without a category" do
				category = Category.create(title: "cactus")
				item = Item.create(title: "cactus",
												description:	"It has flowers",
												price: 10,
												status: 0,
												image_file_name: "FullSizeRender.jpg", 
												image_content_type: "image/jpeg", 
												image_file_size: 346843)

					expect(item).to be_invalid
			end

			it "is invalid without an image" do
				category = Category.create(title: "cactus")
				item = Item.create(title: "cactus",
													description:	"It has flowers",
													price: 10,
													status: 0)

					expect(item).to be_invalid
			end
		end
	end
	
	describe 'Relationships' do
		it 'belongs to a category' do 
			category = Category.create(title: "cactus")
			item = Item.create(title: "cactus",
												description:	"It has flowers",
												price: 10,
												category: category,
												status: 0,
												image_file_name: "FullSizeRender.jpg", 
												image_content_type: "image/jpeg", 
												image_file_size: 346843)

			expect(item).to respond_to(:category)
		end
	end
end

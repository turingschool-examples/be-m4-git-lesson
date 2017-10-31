FactoryBot.define do
  factory :item do
    sequence :title do
      Faker::Hipster.word
    end

    sequence :description do
      Faker::Lorem.sentence
    end

    sequence :price do
      Faker::Number.digit
    end

    image_file_name "FullSizeRender.jpg"
    image_content_type "image/jpeg"
    image_file_size 346843
  end
end

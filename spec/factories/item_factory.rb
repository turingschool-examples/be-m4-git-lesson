FactoryBot.define do
  factory :item do
    title "Plant"
    description "It's pretty"
    status 0
    price 10
    image_file_name "FullSizeRender.jpg"
    image_content_type "image/jpeg"
    image_file_size 346843
  end
end

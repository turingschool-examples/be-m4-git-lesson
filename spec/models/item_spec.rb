require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).allowing("image/jpg", "image/jpeg", "image/png") }
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:category) }
    it { should define_enum_for(:status) }

  end

  describe 'relationships' do
    it { should belong_to(:category) }
    it { should respond_to(:category) }
    it { should have_many(:orders) }
    it { should respond_to(:orders) }
  end
end

require 'rails_helper'

RSpec.describe Category do
  describe "Validations" do
    context "valid attribute" do
      it { should validate_presence_of(:title) }
      it { should validate_uniqueness_of(:title) }
    end

    describe "relationship" do
      it { should have_many(:items) }
    end
  end
end

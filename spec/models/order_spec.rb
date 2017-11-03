require 'rails_helper'

RSpec.describe Order do
  describe "validations" do
    it{ should validate_presence_of(:status) }
    it { should define_enum_for(:status) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should respond_to(:user) }
    it { should have_many(:items) }
    it { should respond_to(:items) }
  end
end

require 'rails_helper'

RSpec.describe User do
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:role) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
    it { should define_enum_for(:role) }
  end
end

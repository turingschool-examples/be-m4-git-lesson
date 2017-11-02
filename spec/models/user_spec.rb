require 'rails_helper'

RSpec.describe User do
  describe "Validations" do
    context "valid attributes" do
      it "is valid with email, first_name, last_name, address, role, password" do
        user = User.new(email: "name@me.com",
                    first_name: "John",
                    last_name: "Doe",
                    address: "123 House Lane Denver, CO",
                    role: 0,
                    password: "test")
        expect(user).to be_valid
      end
    end
  end
end

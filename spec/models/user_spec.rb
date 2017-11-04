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

  describe "user roles" do
    it 'user can be created as a default user' do
      user = User.create(first_name: 'Django',
                         last_name: 'Unchained',
                         email: 'cool',
                         address: 'wherever',
                         password: 'django',
                         role: 0)

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it "user can be created as an admin" do
      user = User.create(first_name: 'Django',
                         last_name: 'Unchained',
                         email: 'cool',
                         address: 'wherever',
                         password: 'django',
                         role: 1)

      expect(user).to be_valid
      expect(user.role).to eq("admin")
      expect(user.admin?).to be_truthy
    end

    it "user defaulted to default user" do
      user = User.create(first_name: 'Django',
                         last_name: 'Unchained',
                         email: 'cool',
                         address: 'wherever',
                         password: 'django')

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy
    end

    it 'user can be converted from default to admin' do
     user = User.create(first_name: 'Django',
                         last_name: 'Unchained',
                         email: 'cool',
                         address: 'wherever',
                         password: 'django')

      expect(user).to be_valid
      expect(user.role).to eq("default")
      expect(user.default?).to be_truthy

      user.admin!
      expect(user.role).to eq('admin')
    end
  end

  describe "relationships" do
    it { should have_many(:orders) }
    it { should respond_to(:orders) }
  end
end

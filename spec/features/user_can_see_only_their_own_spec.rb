require 'rails_helper'

RSpec.describe 'Users can only see their own data' do
  let!(:user) { create(:user) }
  let!(:admin) { create(:user, role: 1) }

  it 'user can not view anohter users private data' do


  end

  it 'user cannot view an administrators screen' do

  end

  it 'user cannot use admin functionality' do

  end

  it 'user cannot make themself an admin' do

  end
end



# Background: An authenticated user

# As an Authenticated User
# I cannot view another user’s private data (current or past orders, etc)
# I cannot view the administrator screens or use admin functionality
# I cannot make myself an admin

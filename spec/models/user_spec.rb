require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with name and email" do
    user = build(:user)
    expect(user).to be_valid
  end

  it "is invalid without name" do
    user = build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "is invalid without email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
end
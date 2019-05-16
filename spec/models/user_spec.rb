require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
  end

  describe "class methods" do
    it "authenticate returns a user if there is a matching user and password" do
      name = "bob"
      email = "bob@example.com"
      password = "pw123"
      user = User.create!(name: name, email: email, password: password)
      expect(User.authenticate(email, password)).to eq(user)
    end

    it "authenticate returns nil if there is no matching user and password" do
      name = "bob"
      email = "bob@example.com"
      password = "pw123"
      user = User.create!(name: name, email: email, password: password)
      expect(User.authenticate(email, "wrong")).to eq(nil)
    end
  end
end

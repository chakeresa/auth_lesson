require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the secret page" do
    it "I am returned to the login page" do
      visit "/secret"

      expect(current_path).to eq("/login")
    end
  end
end

RSpec.describe "As a logged-in user", type: :feature do
  describe "when I visit the secret page" do
    it "I see the secret page" do
      name = "user 1"
      email = "example@example.com"
      password = "pw123"
      user = User.create!(name: name, email: email, password: password)

      visit "/login"

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log Me In!"

      visit "/secret"

      expect(current_path).to eq("/secret")
    end
  end
end
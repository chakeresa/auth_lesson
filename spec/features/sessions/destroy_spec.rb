require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I am logged in and on the users index" do
    it "I can log out" do
      name = "user 1"
      email = "example@example.com"
      password = "pw123"
      user = User.create!(name: name, email: email, password: password)

      visit "/login"

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log Me In!"

      click_button "Log Out"

      expect(current_path).to eq(users_path)
      expect(page).to have_link("Log In")
      expect(page).to_not have_link("Log Out")
    end
  end
end
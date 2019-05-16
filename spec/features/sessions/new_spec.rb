require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the login page" do
    it "shows a form to enter email and password" do
      name = "user 1"
      email = "example@example.com"
      password = "pw123"
      user = User.create!(name: name, email: email, password: password)

      visit "/login"

      fill_in :email, with: email
      fill_in :password, with: password
      click_button "Log Me In!"

      expect(current_path).to eq(users_path)
      expect(page).to have_content("Welcome #{name}, you are logged in!")
      expect(page).to_not have_link("Log In")
    end
  end
end
require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the user index page" do
    it "shows a list of all users and their emails" do
      user_1 = User.create!(name: "name one", email: "my email", password: "password123")
      user_2 = User.create!(name: "name two", email: "your email", password: "password12345")

      visit users_path

      within("#user-#{user_1.id}") do
        expect(page).to have_content(user_1.name)
        expect(page).to have_content(user_1.email)
      end

      within("#user-#{user_2.id}") do
        expect(page).to have_content(user_2.name)
        expect(page).to have_content(user_2.email)
      end
    end

    it "has a link to register a new user" do
      visit users_path
      click_link "Register as User"

      expect(current_path).to eq(new_user_path)
    end
  end
end
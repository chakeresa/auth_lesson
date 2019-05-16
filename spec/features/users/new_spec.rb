require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the new user page" do
    it "shows a form to create a new user" do
      name = "user 1"
      email = "example@example.com"
      password = "pw123"

      visit new_user_path

      fill_in :user_name, with: name
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      click_button "Create User"

      new_user = User.last

      expect(current_path).to eq(users_path)
      expect(page).to have_content(name)
      expect(page).to have_content(email)
      expect(new_user.name).to eq(name)
      expect(new_user.email).to eq(email)
      expect(new_user.password).to eq(password)
    end
  end
end
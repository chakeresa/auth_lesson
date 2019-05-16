require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "when I visit the user index page" do
    it "has a link to register a new user" do
      visit users_path
      click_link "Register as User"

      expect(current_path).to eq(new_user_path)
    end
  end
end
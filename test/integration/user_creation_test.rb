require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "can create a new user" do
    visit new_user_path

    fill_in "Username", with: "Greg"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Create Account"

    assert page.has_content?("Greg")
    assert page.has_content?("Account created.")
  end
end

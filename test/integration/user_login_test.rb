require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(username: "Greg", password: "password")

    visit login_path

    fill_in "Username", with: "Greg"
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Welcome, Greg")
    assert page.has_content?("Login successful.")
  end
end

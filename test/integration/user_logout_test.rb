require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest
  test "registered user can logout" do
    user = User.create(username: "Greg", password: "password")

    visit login_path

    fill_in "Username", with: "Greg"
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Greg")
    assert page.has_content?("Login successful.")

    click_link "Logout"

    refute page.has_content?("Greg")
  end
end

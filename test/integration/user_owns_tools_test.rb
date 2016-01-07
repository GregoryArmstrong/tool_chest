require 'test_helper'

class UserOwnsToolsTest < ActionDispatch::IntegrationTest
  test "registered user can see their own tools" do
    skip
    user = User.create(username: "Greg", password: "password")
    user_2 = User.create(username: "NotGreg", password: "password")

    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_on "Login"

    assert page.has_content?("Greg")
    assert page.has_content?("Login successful.")

    visit tools_path

    click_on "New Tool"

    fill_in "Name", with: "BandSaw"
    fill_in "Use", with: "BandSawin'"
    click_on "Create Tool"

    visit user_path(user)

    assert page.has_content?"BandSaw"
    assert page.has_content?"BandSawin'"

    click_link "Logout"

    visit login_path

    fill_in "Username", with: user_2.username
    fill_in "Password", with: "password"
    click_on "Login"

    visit user_path(user_2)

    refute page.has_content?"BandSawin'"
  end
end

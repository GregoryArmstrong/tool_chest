require 'test_helper'

class AdminToolCreationTest < ActionDispatch::IntegrationTest
  test "admin can create a tool" do
    admin = User.create(username: "admin", password: "password", role: 1)
    user = User.create(username: "Greg", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_tools_path

    assert page.has_content?("Welcome, admin")

    click_on "New Tool"
    save_and_open_page
    fill_in "Name", with: "BandSaw"
    fill_in "Use", with: "BandSawin'"
    fill_in "tool_user_id", with: user.id
    click_on "Create Tool"

    visit admin_tools_path(admin)

    assert page.has_content?("BandSaw")
    assert page.has_content?("BandSawin'")

    click_on "Logout"

    refute page.has_content?("Welcome, admin")
  end
end

require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin sees full CRUD tools index" do
    admin = User.create(username: "admin", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_tools_path
    assert page.has_content?("Tools Index")
  end

  test "default user does not see admin tools index" do
    user = User.create(username: "default_user", password: "password", role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_tools_path
    refute page.has_content?("Tools Index")
    assert page.has_content?("The page you were looking for doesn't exist.")
  end
end

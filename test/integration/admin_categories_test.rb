require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest
  test "logged in admin sees full CRUD tools index" do
    admin = User.create(username: "admin", password: "password", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_tools_path
    assert page.has_content?("Tools Index")
  end
end

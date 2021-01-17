require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  # メールアドレスが正しく、パスワードが間違っているときのテスト
  test "login with valid email/invalid password" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: "invalid" } }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end

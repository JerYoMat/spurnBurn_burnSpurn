require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:smokey_steve)
    @new_user = {name: "test user", email: "tango@test.com", password: "password", password_confirmation: "password", smoking_status: 'occasional'}
  end
  teardown do 
    Rails.cache.clear
  end 

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end
  
  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: {name: @new_user[:name],
                                       email: @new_user[:email],
                                       password: @new_user[:password],
                                       password_confirmation: @new_user[:password_confirmation],
                                       smoking_status: @new_user[:smoking_status]  } }
    end
    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: {user: {name: @new_user[:name],
                                            email: @new_user[:email],
                                            password: @new_user[:password],
                                            password_confirmation: @new_user[:password_confirmation],
                                            smoking_status: @new_user[:smoking_status]  } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end

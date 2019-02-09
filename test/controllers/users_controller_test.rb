require 'test_helper'
class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:smokey_steve)
    @new_user = {name: "test user", email: "tango@test.com", password: "password", password_confirmation: "password", smoking_status: 'occasional'}
  end

  teardown do 
    Rails.cache.clear
  end 

#User data should not be publicly visible, specifically whether an individual is a smoker or not is personal, limit show, edit to owning user only.  
#Update and destroy should only be accessible to owning user

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

  test "should show user to owning user" do
    log_in_as(@user)
    get user_url(@user)
    assert_response :success
  end

  test "should not show to non owning user" do 
    get user_url(@user)
    assert_redirected_to root_path
  end 

  test "should get edit for owning user" do
    log_in_as(@user)
    get edit_user_url(@user)
    assert_response :success
  end

  test "gets root when trying to view other user's edit" do
    get edit_user_url(@user)
    assert_redirected_to root_path
  end

  test "should update owning user" do
    log_in_as(@user)
    patch user_url(@user), params: {user: {name: @user.name,
                                            email: @user.email,
                                            smoking_status: 'former'  } }
    assert User.find(@user.id).smoking_status == 'former' 
  end

  test "should not update with other user" do
    patch user_url(@user), params: {user: {name: @new_user[:name],
                                            email: @new_user[:email],
          
                                            smoking_status: @new_user[:smoking_status]  } }
    assert_not  @user.name == @new_user[:name]
  end

  test "should destroy user" do
    log_in_as(@user)
    session[:user_id] = @user.id
    @current_user = @user  
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end
    assert_redirected_to users_url
  end

  test 'non-owning user cannot destroy' do 
    assert_no_difference('User.count') do 
      delete user_url(@user)
    end   
  end 
end

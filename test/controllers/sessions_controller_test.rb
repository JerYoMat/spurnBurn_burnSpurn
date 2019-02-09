require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @user = users(:smokey_steve)
  end 

  teardown do
    Rails.cache.clear 
  end 

  test 'should get new' do 
    get login_path 
    assert_response :success
  end 

  test 'user is redirected to login with wrong creds' do 
    get login_path
    post login_path, params: {session: {email: @user.email,
      password: 'not password' }}
    assert_template 'new'
  end 

  

  test 'session cleared after logging out' do
    log_in_as_t(@user)
    delete logout_path 
    assert session[:user_id] == nil
  end 

  test 'after logging out user goes to root' do 
    log_in_as_t(@user)
    get root_path 
    delete logout_path 
    assert_redirected_to root_path, 'users that log out should be redirected to home'
  end 
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do 
    @user = users(:smokey_steve)
    @new_user = User.new(name: "New Fixture User", email: "testingtest@testuser.com", password: "password", password_confirmation: "password", smoking_status: 'never')
  end 

  teardown do 
    Rails.cache.clear
  end 

  test 'should be valid' do 
     assert @user.valid?
  end 

  test 'user name  is required' do
    @new_user.name = '   ' 
    assert_not @new_user.save 
  end 

  test 'name does not exceed length limit' do 
    @user.name = 'a' * 260 
    assert_not @user.save
  end

  test 'unique email address is required' do 
    @user.save 
    @new_user.email = @user.email.upcase
    assert_not @new_user.save, 'User2 should not save with email equal to existing user'
  end 

  test 'email address does not exceed length limit' do 
    @user.email = 'a' * 250 + '@name.com'
    assert_not @user.save
  end 


  test 'valid email address format is accepted' do 
    valid_email_addresses = %w[test1@use.com TEST@EXAMPLE.CoM with.period@999.com FOREIGN@Gruen.de]
    valid_email_addresses.each do |single_address|
      assert @user.valid?, "#{single_address.inspect} should be valid"  
    end 
  end 

  test 'invalid email address is rejected' do 
    invalid_email_addresses = %w[test.com @gmail.com firstname_last testuser@gmail]
    invalid_email_addresses.each do |single_address|
      @user.email = single_address
      assert_not @user.valid?, "#{single_address.inspect} should not be considered a valid email"
    end 
  end 

  test 'password matches password_confirmation' do 
    @new_user.password_confirmation = ''
    assert_not @new_user.valid?, 'password and password confirmation should match'
  end

  test "password requires minimum length" do 
    @user.password = @user.password_confirmation = "123"
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "1234567"
    assert @user.valid?
  end 

  test 'smoking_status is required' do 
    @new_user.smoking_status = nil
    assert_not @new_user.save 
  end 
end

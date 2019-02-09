require 'test_helper'

class HealthWarningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_warning = health_warnings(:gnarly_foot)
    @user = users(:smokey_steve)
    @other_user = users(:kyle_the_prude)
  end

  test "should get index" do
    get health_warnings_url
    assert_response :success
  end

  test "should get new" do
    get new_health_warning_url
    assert_response :success
  end

  test "logged in user can create" do
    log_in_as_t(@user)
    assert_difference('HealthWarning.count') do
      post health_warnings_url, params: { health_warning: { link: "valid.jpg", name: "new_name" } }
    end
    assert_redirected_to health_warning_url(HealthWarning.last)
  end

  test 'unknown user cannot create' do 
    assert_no_difference('HealthWarning.count') do
      post health_warnings_url, params: { health_warning: { link: "valid.jpg", name: "new_name" } }
    end
    assert_redirected_to root_path
  end 

  test "should show health_warning" do
    get health_warning_url(@health_warning)
    assert_response :success
  end

  test "owning user can edit" do
    get edit_health_warning_url(@health_warning)
    assert_response :success
  end
 

  test "owner can update health_warning" do
    log_in_as_t(@health_warning.user)
    patch health_warning_url(@health_warning), params: { health_warning: { link: @health_warning.link, name: @health_warning.name } }
    assert_redirected_to health_warning_url(@health_warning)
  end

  test "different user cannot update health_warning" do
    log_in_as_t(@other_user)
    patch health_warning_url(@health_warning), params: { health_warning: { link: @health_warning.link, name: "you shouldn't see me " } }
    assert_not HealthWarning.find(@health_warning.id).name == "you shouldn't see me "
  end


  test "owner can destroy health_warning" do
    log_in_as_t(@health_warning.user)
    assert_difference('HealthWarning.count', -1) do
      delete health_warning_url(@health_warning)
    end
    assert_redirected_to health_warnings_url
  end

  test "different user cannot destroy health_warning" do
    assert_no_difference('HealthWarning.count') do
      delete health_warning_url(@health_warning)
    end
  end

end

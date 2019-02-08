require 'test_helper'

class HealthWarningsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @health_warning = health_warnings(:one)
  end

  test "should get index" do
    get health_warnings_url
    assert_response :success
  end

  test "should get new" do
    get new_health_warning_url
    assert_response :success
  end

  test "should create health_warning" do
    assert_difference('HealthWarning.count') do
      post health_warnings_url, params: { health_warning: { link: @health_warning.link, name: @health_warning.name } }
    end

    assert_redirected_to health_warning_url(HealthWarning.last)
  end

  test "should show health_warning" do
    get health_warning_url(@health_warning)
    assert_response :success
  end

  test "should get edit" do
    get edit_health_warning_url(@health_warning)
    assert_response :success
  end

  test "should update health_warning" do
    patch health_warning_url(@health_warning), params: { health_warning: { link: @health_warning.link, name: @health_warning.name } }
    assert_redirected_to health_warning_url(@health_warning)
  end

  test "should destroy health_warning" do
    assert_difference('HealthWarning.count', -1) do
      delete health_warning_url(@health_warning)
    end

    assert_redirected_to health_warnings_url
  end
end

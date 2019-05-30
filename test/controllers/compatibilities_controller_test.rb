require 'test_helper'

class CompatibilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compatibility = compatibilities(:one)
  end

  test "should get index" do
    get compatibilities_url
    assert_response :success
  end

  test "should get new" do
    get new_compatibility_url
    assert_response :success
  end

  test "should create compatibility" do
    assert_difference('Compatibility.count') do
      post compatibilities_url, params: { compatibility: { accesory_id: @compatibility.accesory_id, stuffed_animal_id: @compatibility.stuffed_animal_id } }
    end

    assert_redirected_to compatibility_url(Compatibility.last)
  end

  test "should show compatibility" do
    get compatibility_url(@compatibility)
    assert_response :success
  end

  test "should get edit" do
    get edit_compatibility_url(@compatibility)
    assert_response :success
  end

  test "should update compatibility" do
    patch compatibility_url(@compatibility), params: { compatibility: { accesory_id: @compatibility.accesory_id, stuffed_animal_id: @compatibility.stuffed_animal_id } }
    assert_redirected_to compatibility_url(@compatibility)
  end

  test "should destroy compatibility" do
    assert_difference('Compatibility.count', -1) do
      delete compatibility_url(@compatibility)
    end

    assert_redirected_to compatibilities_url
  end
end

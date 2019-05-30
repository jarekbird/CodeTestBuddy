require "application_system_test_case"

class CompatibilitiesTest < ApplicationSystemTestCase
  setup do
    @compatibility = compatibilities(:one)
  end

  test "visiting the index" do
    visit compatibilities_url
    assert_selector "h1", text: "Compatibilities"
  end

  test "creating a Compatibility" do
    visit compatibilities_url
    click_on "New Compatibility"

    fill_in "Accesory", with: @compatibility.accesory_id
    fill_in "Stuffed animal", with: @compatibility.stuffed_animal_id
    click_on "Create Compatibility"

    assert_text "Compatibility was successfully created"
    click_on "Back"
  end

  test "updating a Compatibility" do
    visit compatibilities_url
    click_on "Edit", match: :first

    fill_in "Accesory", with: @compatibility.accesory_id
    fill_in "Stuffed animal", with: @compatibility.stuffed_animal_id
    click_on "Update Compatibility"

    assert_text "Compatibility was successfully updated"
    click_on "Back"
  end

  test "destroying a Compatibility" do
    visit compatibilities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compatibility was successfully destroyed"
  end
end

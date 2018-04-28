require "application_system_test_case"

class PostingsTest < ApplicationSystemTestCase
  setup do
    @posting = postings(:one)
  end

  test "visiting the index" do
    visit postings_url
    assert_selector "h1", text: "Postings"
  end

  test "creating a Posting" do
    visit postings_url
    click_on "New Posting"

    fill_in "Company Name", with: @posting.company_name
    fill_in "Duties", with: @posting.duties
    fill_in "Duties Name", with: @posting.duties_name
    fill_in "Link", with: @posting.link
    fill_in "Position Name", with: @posting.position_name
    fill_in "Qualifications", with: @posting.qualifications
    fill_in "Qualifications Name", with: @posting.qualifications_name
    fill_in "Summary", with: @posting.summary
    fill_in "Summary Name", with: @posting.summary_name
    click_on "Create Posting"

    assert_text "Posting was successfully created"
    click_on "Back"
  end

  test "updating a Posting" do
    visit postings_url
    click_on "Edit", match: :first

    fill_in "Company Name", with: @posting.company_name
    fill_in "Duties", with: @posting.duties
    fill_in "Duties Name", with: @posting.duties_name
    fill_in "Link", with: @posting.link
    fill_in "Position Name", with: @posting.position_name
    fill_in "Qualifications", with: @posting.qualifications
    fill_in "Qualifications Name", with: @posting.qualifications_name
    fill_in "Summary", with: @posting.summary
    fill_in "Summary Name", with: @posting.summary_name
    click_on "Update Posting"

    assert_text "Posting was successfully updated"
    click_on "Back"
  end

  test "destroying a Posting" do
    visit postings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Posting was successfully destroyed"
  end
end

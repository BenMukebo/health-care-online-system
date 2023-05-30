require 'application_system_test_case'

class HealthcareRequestsTest < ApplicationSystemTestCase
  setup do
    @healthcare_request = healthcare_requests(:one)
  end

  test 'visiting the index' do
    visit healthcare_requests_url
    assert_selector 'h1', text: 'Healthcare requests'
  end

  test 'should create healthcare request' do
    visit healthcare_requests_url
    click_on 'New healthcare request'

    fill_in 'Data', with: @healthcare_request.data
    fill_in 'Hospital', with: @healthcare_request.hospital_id
    fill_in 'Organization', with: @healthcare_request.organization_id
    check 'Received' if @healthcare_request.received
    fill_in 'Status', with: @healthcare_request.status
    fill_in 'Title', with: @healthcare_request.title
    fill_in 'User', with: @healthcare_request.user_id
    fill_in 'Valided', with: @healthcare_request.valided
    click_on 'Create Healthcare request'

    assert_text 'Healthcare request was successfully created'
    click_on 'Back'
  end

  test 'should update Healthcare request' do
    visit healthcare_request_url(@healthcare_request)
    click_on 'Edit this healthcare request', match: :first

    fill_in 'Data', with: @healthcare_request.data
    fill_in 'Hospital', with: @healthcare_request.hospital_id
    fill_in 'Organization', with: @healthcare_request.organization_id
    check 'Received' if @healthcare_request.received
    fill_in 'Status', with: @healthcare_request.status
    fill_in 'Title', with: @healthcare_request.title
    fill_in 'User', with: @healthcare_request.user_id
    fill_in 'Valided', with: @healthcare_request.valided
    click_on 'Update Healthcare request'

    assert_text 'Healthcare request was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Healthcare request' do
    visit healthcare_request_url(@healthcare_request)
    click_on 'Destroy this healthcare request', match: :first

    assert_text 'Healthcare request was successfully destroyed'
  end
end

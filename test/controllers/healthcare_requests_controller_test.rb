require 'test_helper'

class HealthcareRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @healthcare_request = healthcare_requests(:one)
  end

  test 'should get index' do
    get healthcare_requests_url
    assert_response :success
  end

  test 'should get new' do
    get new_healthcare_request_url
    assert_response :success
  end

  test 'should create healthcare_request' do
    assert_difference('HealthcareRequest.count') do
      post healthcare_requests_url,
           params: { healthcare_request: { data: @healthcare_request.data, hospital_id: @healthcare_request.hospital_id,
                                           organization_id: @healthcare_request.organization_id, received: @healthcare_request.received, status: @healthcare_request.status, title: @healthcare_request.title, user_id: @healthcare_request.user_id, valided: @healthcare_request.valided } }
    end

    assert_redirected_to healthcare_request_url(HealthcareRequest.last)
  end

  test 'should show healthcare_request' do
    get healthcare_request_url(@healthcare_request)
    assert_response :success
  end

  test 'should get edit' do
    get edit_healthcare_request_url(@healthcare_request)
    assert_response :success
  end

  test 'should update healthcare_request' do
    patch healthcare_request_url(@healthcare_request),
          params: { healthcare_request: { data: @healthcare_request.data, hospital_id: @healthcare_request.hospital_id,
                                          organization_id: @healthcare_request.organization_id, received: @healthcare_request.received, status: @healthcare_request.status, title: @healthcare_request.title, user_id: @healthcare_request.user_id, valided: @healthcare_request.valided } }
    assert_redirected_to healthcare_request_url(@healthcare_request)
  end

  test 'should destroy healthcare_request' do
    assert_difference('HealthcareRequest.count', -1) do
      delete healthcare_request_url(@healthcare_request)
    end

    assert_redirected_to healthcare_requests_url
  end
end

require 'test_helper'

class WptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wpt = wpts(:one)
  end

  test "should get index" do
    get wpts_url
    assert_response :success
  end

  test "should get new" do
    get new_wpt_url
    assert_response :success
  end

  test "should create wpt" do
    assert_difference('Wpt.count') do
      post wpts_url, params: { wpt: { document_complete_t: @wpt.document_complete_t, dom_interactive_t: @wpt.dom_interactive_t, first_byte_t: @wpt.first_byte_t, load_t: @wpt.load_t, ref: @wpt.ref, request_count: @wpt.request_count, speed_index: @wpt.speed_index, url_id: @wpt.url_id } }
    end

    assert_redirected_to wpt_url(Wpt.last)
  end

  test "should show wpt" do
    get wpt_url(@wpt)
    assert_response :success
  end

  test "should get edit" do
    get edit_wpt_url(@wpt)
    assert_response :success
  end

  test "should update wpt" do
    patch wpt_url(@wpt), params: { wpt: { document_complete_t: @wpt.document_complete_t, dom_interactive_t: @wpt.dom_interactive_t, first_byte_t: @wpt.first_byte_t, load_t: @wpt.load_t, ref: @wpt.ref, request_count: @wpt.request_count, speed_index: @wpt.speed_index, url_id: @wpt.url_id } }
    assert_redirected_to wpt_url(@wpt)
  end

  test "should destroy wpt" do
    assert_difference('Wpt.count', -1) do
      delete wpt_url(@wpt)
    end

    assert_redirected_to wpts_url
  end
end

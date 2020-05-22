# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @post = @user.posts.new(store_name: 'CoffeeShop', address: 'jyusho', address_prefectures: '北海道', time_start: '09:00', time_end: '18:00', wifi: 'NULL', plug: 'NULL', tabacco: 'true', card: 'true', evaluation1: 'NULL', evaluation2: 'NULL', evaluation3: '1', evaluation4: '1', evaluation5: '1')
  end

  test 'should get new' do
    get new_post_path
    assert_template 'posts/new'
  end

  test 'should post new' do
    post new_post_path
    assert_response :success
  end

  test 'should get index' do
    get post_path
    assert_template 'posts/index'
  end
end

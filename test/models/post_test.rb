# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @post = @user.posts.new(store_name: 'CoffeeShop', address: 'jyusho', address_prefectures: '北海道', time_start: '09:00', time_end: '18:00', wifi: 'NULL', plug: 'NULL', tabacco: 'true', card: 'true', evaluation1: 'NULL', evaluation2: 'NULL', evaluation3: '1', evaluation4: '1', evaluation5: '1')
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'store_name should be present' do
    @post.store_name = '     '
    assert_not @user.valid?
  end

  test 'store_name should not be too long' do
    @post.store_name = 'a' * 21
    assert_not @user.valid?
  end

  test 'address should be present' do
    @post.address = '     '
    assert_not @user.valid?
  end

  test 'address should not be too long' do
    @post.address = 'a' * 51
    assert_not @user.valid?
  end

  test 'address_prefectures should not be present' do
    @post.address_prefectures = '     '
    assert_not @user.valid?
  end

  test 'time_start should be present' do
    @post.time_start = '     '
    assert_not @user.valid?
  end

  test 'time_end should be present' do
    @post.time_end = '     '
    assert_not @user.valid?
  end
end

# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # このコードは慣習的に正しくない
    @post = @user.posts.new(store_name: 'CoffeeShop', address: 'jyusho')
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

  test 'address should be present' do
    @post.address = '     '
    assert_not @user.valid?
  end


end

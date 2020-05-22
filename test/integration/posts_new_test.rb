# frozen_string_literal: true

require 'test_helper'

class PostsNewTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test 'post interface' do
    log_in_as(@user)
    get new_post_path
    assert_template 'posts/new'
    assert_difference 'Post.count', 1 do
      post post_create_path, params: { post: { store_name: 'CoffeeShop',
                                               address: 'jyusho',
                                               address_prefectures: '北海道',
                                               time_start: '09:00',
                                               time_end: '18:00',
                                               wifi: 'NULL',
                                               plug: 'NULL',
                                               tabacco: 'true',
                                               card: 'true',
                                               evaluation1: 'NULL',
                                               evaluation2: 'NULL',
                                               evaluation3: '1',
                                               evaluation4: '1',
                                               evaluation5: '1' } }
    end
    assert_redirected_to post_path
  end
end
